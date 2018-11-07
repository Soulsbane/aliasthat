module aliasthat.traits;

/**
	Returns a string array of all the members of T

	Params:
		T = The struct, class etc to get the members of.
*/
template allMembers(T)
{
	enum allMembers = __traits(allMembers, T);
}

///
@("allMembers")
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

/**
	Returns the member name as a string.

	Params:
		nameType = The member to get.
*/
template nameOf(alias nameType)
{
	enum string nameOf = __traits(identifier, nameType);
}

///
@("nameOf")
unittest
{
	immutable int name;
	assert(nameOf!name == "name");
}

/**
	Returns the number of members in type T.

	Params:
		T = The type to get member count of.

	Returns:
		Returns the number of members in type T.
*/
template memberCount(T)
{
	enum memberCount = [__traits(allMembers, T)].length;
}

unittest
{
	struct Person
	{
		string name;
		uint age;
		string address;
	}

	assert(memberCount!Person == 3);
}
