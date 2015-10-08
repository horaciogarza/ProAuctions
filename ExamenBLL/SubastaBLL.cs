using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ExamenDAL;

namespace ExamenBLL
{
    public class SubastaBLL
    {
        public List<Auction> cargarSubastas() {
            SubastaDAL dal = new SubastaDAL();

            return dal.cargarSubastas();

        }

        public Auction cargarSubastaEspecifico(int idSubasta)
        {
            SubastaDAL dal = new SubastaDAL();

            return dal.cargarSubastaEspecifico(idSubasta);
        }

        public void UpdateSubasta(Auction subasta) {
            SubastaDAL dal = new SubastaDAL();
            dal.UpdateSubasta(subasta);
        }

        public User cargarNombreUsuario(int? idUsuario)
        {
            SubastaDAL dal = new SubastaDAL();

            return dal.cargarNombreUsuario(idUsuario);
        }

        public void AgregarAuctionRecord(AuctionRecord record)
        {

            SubastaDAL dal = new SubastaDAL();

            dal.AgregarAuctionRecord(record);
        }

        public List<AuctionRecord> cargarAuctionrecord(int AuctionId)
        {

            SubastaDAL dal = new SubastaDAL();

            return dal.cargarAuctionrecord(AuctionId);
        }

        public Auction cargarSubastaHistorial(int AuctionId)
        {
            SubastaDAL dal = new SubastaDAL();

            return dal.cargarSubastaHistorial(AuctionId);
        }

        public Auction cargarSubastaHistorialOpcion(int UserId)
        {

            SubastaDAL dal = new SubastaDAL();

            return dal.cargarSubastaHistorialOpcion(UserId);
        }

        public void AgregarNuevaSubasta(Auction auction) {

            SubastaDAL dal = new SubastaDAL();

            dal.AgregarNuevaSubasta(auction);
        }

        public List<Auction> ConteoDeSubastas(int UserId) {

            SubastaDAL dal = new SubastaDAL();

            return dal.ConteoDeSubastas(UserId);
        }

        public List<AuctionRecord> CargarDDLGRID(int AuctionId, int usuarioId) 
        {
            SubastaDAL dal = new SubastaDAL();

            return dal.CargarDDLGRID(AuctionId, usuarioId);
        }
    }
}
