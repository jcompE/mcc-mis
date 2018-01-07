namespace AdminMIS
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Department")]
    public partial class Department
    {
        public int DepartmentID { get; set; }

        [StringLength(20)]
        public string DepartmentCode { get; set; }

        [StringLength(30)]
        public string DepartmentName { get; set; }

        public bool? IsActive { get; set; }
    }
}
