module aliasthat.aliasthat;

template allMembers(T)
{
	enum allMembers = __traits(allMembers, T);
}

unittest
{
	struct Test
	{
		string name;
		uint id;
		bool enabled;
	}

	assert(allMembers!Test.length == 3);
	assert(allMembers!Test[0] == "name");
	assert([allMembers!Test] == ["name", "id", "enabled"]);
}

template nameOf(alias nameType)
{
	enum string nameOf = __traits(identifier, nameType);
}

unittest
{
	int name;
	assert(nameOf!name == "name");
}

/**
	Scherkl-Nielsen self-important lookup.
	See: https://dlang.org/blog/2017/02/13/a-new-import-idiom/
*/
template from(string moduleName)
{
  mixin("import from = " ~ moduleName ~ ";");
}
