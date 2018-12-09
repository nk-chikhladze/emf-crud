using System;
using System.Linq;
using System.Data.Entity;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace WebEntityFramework
{
    public partial class Default : System.Web.UI.Page
    {
        // Database
        Model1Container dbContext;

        protected void Page_Load(object sender, EventArgs e)
        {
            dbContext = new Model1Container();
            ListView1.InsertItemPosition = InsertItemPosition.LastItem;
        }

        // ...

        // Show all customers
        public IQueryable<Customer> GetCustomers()
        {
            // LINQ-query to select from db
            return dbContext.CustomerSet.AsQueryable<Customer>();
        }

        // Edit customer
        public void EditCustomer(int? customerId)
        {
            Customer customer = dbContext.CustomerSet
                .Where(c => c.CustomerId == customerId).FirstOrDefault();

            if (customer != null && TryUpdateModel<Customer>(customer))
            {
                // update with Entity Framework
                dbContext.Entry<Customer>(customer).State = EntityState.Modified;
                dbContext.SaveChanges();
            }
        }

        // Delete customer
        public void DeleteCustomer()
        {
            Customer customer = new Customer();

            if (TryUpdateModel<Customer>(customer))
            {
                dbContext.Entry<Customer>(customer).State = EntityState.Deleted;
                dbContext.SaveChanges();
            }
        }

        // Add new customer
        public void InsertCustomer()
        {
            Customer customer = new Customer();

            if (TryUpdateModel<Customer>(customer))
            {
                dbContext.Entry<Customer>(customer).State = EntityState.Added;
                dbContext.SaveChanges();
            }
        }
    }
}