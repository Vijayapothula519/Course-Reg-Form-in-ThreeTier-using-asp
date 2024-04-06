using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessLayerApplicationsindhu;
using System.Data;
using System.Data.SqlClient;
using DataLayerApplication_sindhu;

namespace BusinessLayerApplicationsindhu
{
     public class CourseLogic
    {
        public static string ConnectionString = "Data Source=DESKTOP-L5DGAO5;Initial Catalog=sindhu;user id=sa; password=Vijaya@123;Integrated Security=True ";

        public static CourseClass Emp;
        public DataSet getEmployeeData()
        {
            DataSet ds = DataClass.GetData(ConnectionString, "GetCourseSindhu");
            return ds;
        }

        public int InsertData(CourseClass emp)
        {
            SqlParameter[] parms = new SqlParameter[4];
            parms[0] = new SqlParameter("@CourseName", SqlDbType.VarChar);
            parms[0].Value = emp.CourseName;
            parms[1] = new SqlParameter("@CourseCode", SqlDbType.VarChar);
            parms[1].Value = emp.CourseCode;
            parms[2] = new SqlParameter("@Description", SqlDbType.VarChar);
            parms[2].Value = emp.Description;
            parms[3] = new SqlParameter("@CourseStartDate", SqlDbType.Date);
            parms[3].Value = emp.CourseStartDate;
            return DataClass.Modification(ConnectionString, "InsertCourseSindhu", parms);

        }
        
        public int DeleteData(int CourseId)
        {
            SqlParameter[] parms = new SqlParameter[1];
            parms[0] = new SqlParameter("@CourseId", SqlDbType.Int);
            parms[0].Value = CourseId;
            return DataClass.Modification(ConnectionString, "DeleteCourseSindhu", parms);

        }
    }
}
