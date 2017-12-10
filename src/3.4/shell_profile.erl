%%%-------------------------------------------------------------------
%%% 
%%% @author 	Prakash Parmar <prakash.parmar@outlook.com>
%%%
%%% @version 	Beta
%%%
%%% @doc
%%%		Module Contains Default profile settings and API to beautify prints. 
%%%		only ANSI Color codes are supprots.
%%%
%%%			ANSI Color Codes Guide :
%%%			========================
%%%
%%%				\e[0;33;0m -> Here 	first Digit indicates Text attributes, 
%%%									Second Digit indicates Foregound Color
%%%									and Last Third Digit indicates Background Color
%%%
%%%							So, \e['Text_attribute';'Foreground_color';'Background_color'm
%%%
%%%				Possible values :
%%%			    ------------------
%%%					Text Attributes- 		0	default text attributes
%%%											1 	Bright
%%%											2	Dim
%%%											4	underline
%%%											7	inverse
%%%											8 	Hidde
%%%
%%%					Foreground Color -		30	Black
%%%											31	Red
%%%											32	Green
%%%											33 	Yellow
%%%											34	Blue
%%%											35 	Magenta
%%%											36	Cyan
%%%											37 	White
%%%											39	default foreground 
%%%
%%%					Background Color -		40 	Black
%%%											41	Red
%%%											42	Green
%%%											43 	Yellow
%%%											44	Blue
%%%											45 	Magenta
%%%											46	Cyan
%%%											47 	White
%%%											49	default foreground 
%%%											
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
								
								{ term, 	"\e[0;32m~ts\e[0m" },	% atom, integer
								{ name, 	"\e[1;35m~ts\e[0m" },	% record and map name
								{ field,	"\e[0;34m~ts\e[0m" },	% record field
								{ string,	"\e[0;33m~ts\e[0m" },
								{ digits,	"\e[0;32m~ts\e[0m" },
								{ function, "\e[0;35m~ts\e[0m" },	% function name
								{ prompt,	"\e[2;33m~ts\e[0m" }	% Shell prompt

		 					]).

%% ====================================================================
%% APIs
%% ====================================================================

%%-------------------------------------------------------------------
%% @doc
%%		Function Based on Class and pre-defined Color Schems adds
%%	Color codes to input string.
%%
%%	Function Arguments :
%%	 Argument 1 : An Atom indicates string type
%%				 Possible Values :	sb, cb, rb, bstr, pipe, comma,colon, 
%%									hash, ellipsis, eq, arrow, term, name, 
%%									field, string, digits, function, prompt
%%
%%	Argument 2 : A String,
%%				 For Eg, "[" or "atom"'
%%	@spec beautify( atom(), list() ) -> list().
%%-------------------------------------------------------------------

beautify(Class,Str) ->
	case lists:keyfind(Class, 1, ?DEFAULT_PROFILE) of
		{ Class, Format_specifier } ->
			lists:flatten(io_lib:format(Format_specifier,[Str]));
		_not_found ->
			Str
	end.
