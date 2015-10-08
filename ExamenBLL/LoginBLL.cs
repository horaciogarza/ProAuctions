using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ExamenDAL;

namespace ExamenBLL
{
    public class LoginBLL
    {


        public List<User> consultarUserPorUsername(string username, string password)
        {
            LoginDAL dal = new LoginDAL();

            User user = new User();

            user = dal.consultarUserPorUsername(username).First(); ;

            if (user.Password == password)
            {
                return dal.consultarUserPorUsername(username);
            }
            else
            {
                throw new Exception("la Contraseña es incorrecta");
            }
        }

        public void nuevoRegistro(User usuario) 
        {
            LoginDAL dal = new LoginDAL();

            dal.nuevoRegistro(usuario);
        }

        public  bool validarCorreoUnico(string email) 
        {

            LoginDAL dal = new LoginDAL();

            return dal.validarCorreoUnico(email);
        }

        public bool validarUsuarioUnico(string username)
        {

            LoginDAL dal = new LoginDAL();

            return dal.validarUsuarioUnico(username);
        }

    }
}
