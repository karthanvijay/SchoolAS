using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SchoolManagement.Helpers
{
    public class SessionVariables
    {
        public const string UserIdInSession = "UserIdInSession";

        #region StudentMaintenance

        public const string StudentSelectedToUpdate = "StudentSelectedToUpdate";

        #endregion

        #region AccountMaintenance

        public const string StudentSelectedToUpdateInAccountMaintenance = "StudentSelectedToUpdateInAccountMaintenance";

        #endregion

        #region User Maintenance

        public const string UserSelectedToUpdateInUserMaintenance = "UserSelectedToUpdateInUserMaintenance";

        #endregion

    }
}