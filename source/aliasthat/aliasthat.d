module aliasthat.aliasthat;

alias Helper(alias T) = T;

private template allMembers(T)
{
	enum allMembers = __traits(allMembers, T);
}

template nameOf(alias nameType)
{
	enum string nameOf = __traits(identifier, nameType);
}
