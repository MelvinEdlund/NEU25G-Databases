using System;
using System.Collections.Generic;
using System.Text;

namespace L014_RepositoryPattern.Domain;

internal interface IHasId<TId>
{
    TId Id { get; }
}
