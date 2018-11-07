module aliasthat.from;

/**
	Scherkl-Nielsen self-important lookup.
	See: https://dlang.org/blog/2017/02/13/a-new-import-idiom/

	Params:
		moduleName = The module to import.
*/
template from(string moduleName)
{
	mixin("import from = " ~ moduleName ~ ";");
}
