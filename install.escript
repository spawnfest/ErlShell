#!/usr/bin/env escript

-module(install).
-export([main/0, main/1]).

-define(BACKUP_SUFFIX, ".backup-pre-pretty-erlshell").

main() ->
    Path = io_lib:format("~s/ebin",[code:lib_dir(stdlib)]),
    Version = io_lib:format(
        "~s",
        [ element(
            3,
            lists:keyfind(stdlib,1,application:which_applications())
          )
        ]
    ),
    main([Path, Version]).

main([Path, Version]) ->
    io:format("Path = ~s~nVersion = ~s~n", [Path, Version]),
    update_modules(Path, Version);
main(_) -> main().


copy_files(Wildcard, Destination, Modes) ->

	N = lists:foldl(
			        fun(Source, Acc) ->
			            Target = case filelib:is_dir(Destination) of
			                true  -> filename:join(Destination, filename:basename(Source));
			                false -> Destination
			            end,
			            io:format("~ts~n", [Source]),
			            Acc + case file:copy(Source, {Target, Modes}) of
			                {ok, _BytesCopied} ->
			                    {ok, FileInfo} = file:read_file_info(Source),
			                    ok = file:write_file_info(Target, FileInfo),
			                    1;
			                {error, Reason} ->
			                    io:format("~ts~n", [file:format_error(Reason)]),
			                    0
			            end
			        end,
			        0,
			        filelib:wildcard(Wildcard)),
    io:format("~p file(s) copied~n", [N]).

update_modules(Path, App_name) ->

	Bin_dir = filename:join(["ebin", App_name]),

	Files 	= filelib:wildcard(Bin_dir++"/*.beam"),

	Fun = fun(File_abs) ->

				File_rel = File_abs -- (Bin_dir++"/"),

   				Backup = lists:flatten(io_lib:format("~s/" ++ File_rel ++ ?BACKUP_SUFFIX, [Path])),

			    case filelib:is_regular(Backup) of
			        true  ->
			            io:format("Backup of ~p exists~n",[File_rel]),
			            ok;
			        false ->
			            io:format("Backing up existing file~n"),
			            copy_files(
			                filename:join(Path, File_rel),
			                filename:join(Path, File_rel ++ ?BACKUP_SUFFIX), [exclusive])
			    end
			end,
	lists:foreach(Fun, Files),

	io:format("Installing...~n"),
    copy_files( Bin_dir++"/*.beam", Path, []).

