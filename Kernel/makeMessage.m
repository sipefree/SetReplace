(* ::Package:: *)

(* ::Title:: *)
(*makeMessage*)


(* ::Text:: *)
(*Many functions in the package eventually just call setSubstitutionSystem, as such they reuse many of very similar messages. It is therefore useful to have a function that would define a message of a given type for a given function, and then produce this message.*)


(* ::Text:: *)
(*This way, one does not have to define the same messages over and over again for all functions.*)


Package["SetReplace`"]


PackageScope["makeMessage"]


(* ::Section:: *)
(*Implementation*)


makeMessage[function_, type_String, args___] := (
	MessageName[function, type] = messageTemplate[type];
	Message[MessageName[function, type], function, args]
)


(* ::Section:: *)
(*Message templates*)


messageTemplate["setNotList"] =
	"The set specification `2` should be a List.";


messageTemplate["invalidRules"] =
	"The rule specification `2` should be either a Rule, RuleDelayed, or " ~~
	"a List of them.";


messageTemplate["nonIntegerIterations"] =
	"The `2` `3` should be a non-negative integer or infinity.";


messageTemplate["tooSmallStepLimit"] =
	"The maximum `2` `3` is smaller than that in initial condition `4`.";


messageTemplate["nonListExpressions"] =
	"Encountered expression `2` which is not a list, even though a constraint on vertices is specified.";


messageTemplate["invalidMethod"] =
	"Method should be one of " <> ToString[$SetReplaceMethods, InputForm] <> ".";


messageTemplate["lowLevelNotImplemented"] =
	"Low level implementation is only available for local rules, " <>
	"and only for sets of lists (hypergraphs).";


messageTemplate["noLowLevel"] =
	"Low level implementation was not compiled for your system type.";


messageTemplate["notRules"] =
	"The rule specification `2` should be either a Rule, or a List of rules.";


messageTemplate["unknownProperty"] =
	"Property \"`2`\" should be one of \"Properties\".";


messageTemplate["pargx"] =
	"Property \"`2`\" requested with `3` argument`4`; " <>
	"`5``6``7``8` argument`9` `10` expected.";


messageTemplate["stepTooLarge"] =
	"`2` `3` requested out of `4` total.";


messageTemplate["stepNotInteger"] =
	"`2` `3` must be an integer.";


messageTemplate["nonopt"] =
	"Options expected (instead of `3`) " <>
	"beyond position 1 for `2` property. " <>
	"An option must be a rule or a list of rules.";


messageTemplate["optx"] =
	"Unknown option `2` for \"CausalGraph\" property. " <>
	"Only Graph options are accepted.";
