//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Roostersysteem.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class VakUrenCollege
    {
        public Nullable<int> Vak_Id { get; set; }
        public Nullable<int> UrenCollege_Id { get; set; }
        public Nullable<double> Vakduur { get; set; }
        public int VakUrenCollege_Id { get; set; }
    
        public virtual UrenCollege UrenCollege { get; set; }
        public virtual Vak Vak { get; set; }
    }
}
