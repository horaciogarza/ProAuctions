using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ExamenDAL
{
    public class LoginDAL
    {

        public List<User> consultarUserPorUsername(string username)
        {

            IHCEntities context = new IHCEntities();

            var user = from tUser in context.User
                       where tUser.UserName == username
                       select tUser;

            List<User> lstUsuario = new List<User>();

            lstUsuario = user.ToList();

            if (lstUsuario.Count > 0)
            {

                return user.ToList();
            }

            else
            {
                throw new Exception("El usuario no es correcto");
            }

        }


        public void nuevoRegistro(User usuario){

            IHCEntities context = new IHCEntities();
            
            context.User.Add(usuario);
            context.SaveChanges();
        }

        public bool validarCorreoUnico(string email) {

            IHCEntities context = new IHCEntities();

            var user = from tUser in context.User
                       where tUser.Email == email
                       select tUser;

            List<User> lstUsuario = new List<User>();

            lstUsuario = user.ToList();

            if (lstUsuario.Count > 0)
            {

                return false;
            }

            else
            {
                return true;
            }
        }

        public bool validarUsuarioUnico(string username) {

            IHCEntities context = new IHCEntities();

            var user = from tUser in context.User
                       where tUser.UserName == username
                       select tUser;

            List<User> lstUsuario = new List<User>();

            lstUsuario = user.ToList();

            if (lstUsuario.Count > 0)
            {

                return false;
            }

            else
            {
                return true;
            }
        }
    }
}
