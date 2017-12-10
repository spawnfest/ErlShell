%%%-------------------------------------------------------------------
%%% 
%%% @author 	Prakash Parmar <prakash.parmar@outlook.com>
%%%
%%% @version 	Beta
%%%
%%% @doc
%%%		Module Contains Default profile settings and API to beautify. 
%%%		only ANSI Color codes are supprots.
%%%
%%%			Color Codes :
%%%				"\e[0;33m~ts\e[0m"
%%% @end 
%%%
%%% @copyright 2017 Prakash Parmar
%%%-------------------------------------------------------------------

-module(shell_profile).

%% ====================================================================
%% API functions
%% ====================================================================
-export([
			beautify/2 
		]).

%% ====================================================================
%% Definitions
%% ====================================================================

-define( DEFAULT_PROFILE,	[
								{ sb, 	"\e[0;33m~ts\e[0m" }, 	% $[] % NOTE : if Changing Color code than 
																	  %        also Modify lib.erl line:661  
								
								{ cb, 	"\e[1;34m~ts\e[0m" }, 	% ${}

								{ rb, 	"\e[1;34m~ts\e[0m" },	% $()
								{ bstr,	"\e[0;34m~ts\e[0m" },	% $<< >>

								{ pipe,		"\e[0;34m~ts\e[0m" }, 	% $|
								{ comma,	"\e[1;36m~ts\e[0m" }, 	% $,
								{ colon,	"\e[0;34m~ts\e[0m" },	% $:
								{ hash,		"\e[1;34m~ts\e[0m" },	% $#
								{ ellipsis, "\e[0;34m~ts\e[0m" },   % $...
								{ eq,		"\e[0;34m~ts\e[0m" },	% =
								{ arrow,	"\e[0;34m~ts\e[0m" },	% =>
								
								{ term, 	"\e[0;32m~ts\e[0m" },
								{ name, 	"\e[1;35m~ts\e[0m" },
								{ field,	"\e[0;34m~ts\e[0m" },
								{ string,	"\e[0;33m~ts\e[0m" },
								{ digits,	"\e[0;32m~ts\e[0m" },
								{ function, "\e[0;35m~ts\e[0m" },
								{ prompt,	"\e[1;36m~ts\e[0m" }

		 					]).

%% ====================================================================
%% APIs
%% ====================================================================

beautify(Class,Str) ->
	case lists:keyfind(Class, 1, ?DEFAULT_PROFILE) of
		{ Class, Format_specifier } ->
			lists:flatten(io_lib:format(Format_specifier,[Str]));
		_not_found ->
			Str
	end.
