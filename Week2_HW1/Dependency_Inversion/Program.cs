using System;

namespace Dependency_Inversion
{
    class Program
    {
        static void Main(string[] args)
        {
            StockUpdater stockUpdater = new StockUpdater(new Postgres());
            stockUpdater.update();

        }
    }

    public class StockUpdater
    {
        private IDataStore datastore;
        public StockUpdater(IDataStore datastore)
        {
            this.datastore = datastore;
        }
        public void update()
        {
            datastore.update();
        }
    }

    public interface IDataStore
    {
        void update();
    }
    public class Postgres : IDataStore
    {
        //...
        public void update()
        {
            Console.WriteLine("Postgresql was used to update");
            // Add item to database
        }
    }

    public class MsSQL : IDataStore
    {
        //...
        public void update()
        {
            Console.WriteLine("Mssql was used to update");
            // Add item to database
        }
    }

}