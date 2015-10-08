using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;


namespace ExamenDAL
{
    public class SubastaDAL
    {
        public List<Auction> cargarSubastas() {

            IHCEntities context = new IHCEntities();

            var subasta =   from tSubasta in context.Auction
                            select tSubasta;
            
            return subasta.ToList();
        }

        public Auction cargarSubastaEspecifico(int idSubasta)
        {

            IHCEntities context = new IHCEntities();

            var subasta = from tSubasta in context.Auction
                          where tSubasta.AuctionId == idSubasta
                          select tSubasta;

            return subasta.First();
        }

        public void UpdateSubasta(Auction subasta ) {
            IHCEntities context = new IHCEntities(); //USANDO LINQ

            var query = (from tAcution in context.Auction
                         where tAcution.AuctionId == subasta.AuctionId
                         select tAcution).First();

            query.AuctionId = subasta.AuctionId;
            query.Description = subasta.Description;
            query.ProductName = subasta.ProductName;
            query.StartDate = subasta.StartDate;
            query.EndDate = subasta.EndDate;
            query.HighestBid = subasta.HighestBid;
            query.Winner = subasta.Winner;
            context.SaveChanges();
        }

        public User cargarNombreUsuario(int? idUsuario)
        {

            IHCEntities context = new IHCEntities();

            var usuario = from tUsuario in context.User
                          where tUsuario.UserId == idUsuario
                          select tUsuario;

            return usuario.First();
        }

        public void AgregarAuctionRecord(AuctionRecord record) {

            IHCEntities context = new IHCEntities();

            context.AuctionRecord.Add(record);
            context.SaveChanges();
        }

        public List<AuctionRecord> cargarAuctionrecord(int AuctionId)
        {

            IHCEntities context = new IHCEntities();

            var record = from tRecord in context.AuctionRecord
                         where tRecord.AuctionId == AuctionId
                         select tRecord;

            return record.ToList();
        }

        public Auction cargarSubastaHistorial(int AuctionId)
        {

            IHCEntities context = new IHCEntities();

            var subasta = from tSubasta in context.Auction
                          where tSubasta.AuctionId == AuctionId
                          select tSubasta;

            return subasta.First();
        }

        public Auction cargarSubastaHistorialOpcion(int UserId)
        {

            IHCEntities context = new IHCEntities();

            var subasta = from tSubasta in context.Auction
                          where tSubasta.UserId == UserId
                          select tSubasta;

            return subasta.First();
        }

        public void AgregarNuevaSubasta(Auction auction) {

            IHCEntities context = new IHCEntities();

            context.Auction.Add(auction);
            context.SaveChanges();
        }

        public List<Auction> ConteoDeSubastas(int UserId) {
            
            IHCEntities context = new IHCEntities();

            var subasta = from tSubasta in context.Auction
                          where tSubasta.UserId == UserId
                          select tSubasta;

            return subasta.ToList();
        }

        public List<AuctionRecord> CargarDDLGRID(int AuctionId, int usuarioId)
        {

            IHCEntities context = new IHCEntities();

            var record = from tRecord in context.AuctionRecord
                         where tRecord.AuctionId == AuctionId && tRecord.UserId == usuarioId
                         select tRecord;

            return record.ToList();
        }
    }
}
