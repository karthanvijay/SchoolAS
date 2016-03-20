using System;
using System.Collections.Generic;
using System.Linq;

namespace DataLib
{
    public class PageDataService
    {
        #region ConnectionString

        public string GetConnectionStringForMachine()
        {
            for (int x = 0; x < System.Configuration.ConfigurationManager.ConnectionStrings.Count; x++)
            {
                if (System.Configuration.ConfigurationManager.ConnectionStrings[x].Name.Trim().Equals("SchoolManagementEntities"))
                {
                    return System.Configuration.ConfigurationManager.ConnectionStrings[x].ConnectionString;
                }
            }
            throw new Exception("DataLib:DataService - Unknown Machine Name:  and no connectionstring found for ConnectionString SchoolManagement");
        }

        #endregion

        //#region MySqlConnectionObject

        //private SchoolManagementEntities _testdbEntities;

        //public SchoolManagementEntities TestdbEntities
        //{
        //    get
        //    {
        //        return _testdbEntities ?? (_testdbEntities = new SchoolManagementEntities());
        //    }
        //    set
        //    {
        //        _testdbEntities = value;
        //    }
        //}

        //#endregion


        #region SqlServerEntitiesConnectionObject

        private SchoolManagementSystemEntities _testdbEntities;

        public SchoolManagementSystemEntities TestdbEntities
        {
            get
            {
                return _testdbEntities ?? (_testdbEntities = new SchoolManagementSystemEntities());
            }
            set
            {
                _testdbEntities = value;
            }
        }

        #endregion

        //#region SqlServerConnectionObject

        //private OfficeManagementDataContext _oficeManagementDataContext;

        //public OfficeManagementDataContext OfficeManagementDataContext
        //{
        //    get
        //    {
        //        return _oficeManagementDataContext ?? (_oficeManagementDataContext = new OfficeManagementDataContext(GetConnectionStringForMachine()));
        //    }
        //    set
        //    {
        //        _oficeManagementDataContext = value;
        //    }
        //}

        //#endregion

        //#region SqlServer

        //#region User

        //public User AddUser(string userName, string userEmail, string userPassword, DateTime effectiveDate, DateTime expirationDate, int addressId)
        //{
        //    if (GetAddressByAddressId(addressId) != null)
        //    {
        //        var user = new User
        //        {
        //            UserName = userName,
        //            UserEmail = userEmail,
        //            UserPassword = userPassword,
        //            EffectiveDate = effectiveDate,
        //            ExpirationDate = expirationDate,
        //            AddressId = addressId,
        //            DateAdded = DateTime.Now,
        //            IsDeleted = false
        //        };
        //        OfficeManagementDataContext.Users.InsertOnSubmit(user);
        //        OfficeManagementDataContext.SubmitChanges();
        //        return user;
        //    }
        //    return null;
        //}

        //public User GetUserByUserId(int userId)
        //{
        //    return
        //        (from user in OfficeManagementDataContext.Users where user.UserId == userId select user).FirstOrDefault();
        //}

        //public User GetActiiveUserByUserEmail(string userEmail)
        //{
        //    return (from user in OfficeManagementDataContext.Users
        //            where
        //                String.Compare(user.UserEmail, userEmail.Trim(), StringComparison.CurrentCultureIgnoreCase) == 0 &&
        //                user.IsDeleted == false
        //            select user).FirstOrDefault();
        //}

        //public bool DeleteUser(int userId)
        //{
        //    var user = GetUserByUserId(userId);
        //    if (user != null)
        //    {
        //        user.IsDeleted = true;
        //        OfficeManagementDataContext.SubmitChanges();
        //        return true;
        //    }
        //    return false;
        //}

        //#endregion

        //#region Address

        //public Address Address(string addressLineOne, string village, string district, string pincode)
        //{
        //    var address = new Address
        //    {
        //        AdrressLineOne = addressLineOne,
        //        Village = village,
        //        District = district,
        //        Pincode = pincode
        //    };
        //    OfficeManagementDataContext.Addresses.InsertOnSubmit(address);
        //    OfficeManagementDataContext.SubmitChanges();
        //    return address;
        //}

        //public Address UpdateAddress(int addressId, string addressLineOne, string village, string district, string pincode)
        //{
        //    var address = GetAddressByAddressId(addressId);
        //    address.AdrressLineOne = addressLineOne;
        //    address.Village = village;
        //    address.District = district;
        //    address.Pincode = pincode;
        //    OfficeManagementDataContext.SubmitChanges();
        //    return address;
        //}

        //public Address GetAddressByAddressId(int addressId)
        //{
        //    return
        //        (from address in OfficeManagementDataContext.Addresses
        //         where address.AddressId == addressId
        //         select address).FirstOrDefault();
        //}

        //#endregion

        //#region UserGroupAssociation

        //public UserGroupAssociation AddUserGroupAssociation(int groupId, int userId)
        //{
        //    var userGroupAssociation = new UserGroupAssociation
        //                                   {
        //                                       GroupId = groupId,
        //                                       UserId = userId
        //                                   };
        //    OfficeManagementDataContext.UserGroupAssociations.InsertOnSubmit(userGroupAssociation);
        //    OfficeManagementDataContext.SubmitChanges();
        //    return userGroupAssociation;
        //}

        //public List<UserGroupAssociation> GetUserGroupAssociationsByUserId(int userId)
        //{
        //    return (from userGroupAssociation in OfficeManagementDataContext.UserGroupAssociations
        //            where userGroupAssociation.UserId == userId
        //            select userGroupAssociation).ToList();
        //}

        //#endregion

        //#region Medium

        //public Medium AddMedium(string mName)
        //{
        //    var medium = new Medium
        //    {
        //        MediumName = mName
        //    };
        //    OfficeManagementDataContext.Mediums.InsertOnSubmit(medium);
        //    OfficeManagementDataContext.SubmitChanges();
        //    return medium;
        //}

        //#endregion

        //#region Class

        //public Class AddClass(string cName)
        //{
        //    var cls = new Class
        //    {
        //        ClassName = cName
        //    };
        //    OfficeManagementDataContext.Classes.InsertOnSubmit(cls);
        //    OfficeManagementDataContext.SubmitChanges();
        //    return cls;
        //}

        //#endregion

        //#region ExamType

        //public ExamType AddExamType(string cName, int marks, int passingMarks)
        //{
        //    var examType = new ExamType
        //    {
        //        ExamName = cName,
        //        PerSubjectMarks = marks,
        //        PassingMarksPerSubject = passingMarks
        //    };
        //    OfficeManagementDataContext.ExamTypes.InsertOnSubmit(examType);
        //    OfficeManagementDataContext.SubmitChanges();
        //    return examType;
        //}

        //#endregion

        //#region SubjectMaster

        //public SubjectMaster AddSubject(string sName)
        //{
        //    if (GetSubjectByName(sName) != null)
        //        return null;
        //    var subjectType = new SubjectMaster
        //    {
        //        SubjectName = sName,

        //    };
        //    OfficeManagementDataContext.SubjectMasters.InsertOnSubmit(subjectType);
        //    OfficeManagementDataContext.SubmitChanges();
        //    return subjectType;
        //}

        //public SubjectMaster GetSubjectByName(string sName)
        //{
        //    return (from subjectMaster in OfficeManagementDataContext.SubjectMasters
        //            where
        //                subjectMaster.SubjectName.Equals(sName.Trim())
        //            select subjectMaster).FirstOrDefault();
        //}


        //#endregion


        //#region Section

        //public Section AddSection(string sName)
        //{
        //    var section = new Section
        //    {
        //        SectionName = sName
        //    };
        //    OfficeManagementDataContext.Sections.InsertOnSubmit(section);
        //    OfficeManagementDataContext.SubmitChanges();
        //    return section;
        //}

        //#endregion

        //#region Cast

        //public Cast AddCast(string cstName)
        //{
        //    var cast = new Cast
        //    {
        //        CastName = cstName
        //    };
        //    OfficeManagementDataContext.Casts.InsertOnSubmit(cast);
        //    OfficeManagementDataContext.SubmitChanges();
        //    return cast;
        //}

        //#endregion

        //#region Group

        //public Group AddGroup(string grpCode, string grpDescription)
        //{
        //    var group = new Group
        //    {
        //        GroupCode = grpCode,
        //        GroupDescription = grpDescription
        //    };
        //    OfficeManagementDataContext.Groups.InsertOnSubmit(group);
        //    OfficeManagementDataContext.SubmitChanges();
        //    return group;
        //}

        //public bool IsUserAdmin(int userId)
        //{
        //    var userGroupAssociations = GetUserGroupAssociationsByUserId(userId);
        //    var isAdmin = false;
        //    foreach (var userGroupAssociation in userGroupAssociations)
        //    {
        //        if (userGroupAssociation.Group.GroupCode.Equals("Admin"))
        //        {
        //            isAdmin = true;
        //        }
        //    }
        //    return isAdmin;
        //}

        //#endregion

        //#region Student

        //public Student AddStudent(string stuudentName, string mothersName, string fathersName, int age, string gender, int classId, int sectionId, int castId, int mediumId, int addressId)
        //{
        //    var student = new Student
        //                      {
        //                          StudentName = stuudentName,
        //                          MotherName = mothersName,
        //                          FatherName = fathersName,
        //                          Age = age,
        //                          Gender = gender,
        //                          Class = classId,
        //                          SectionId = sectionId,
        //                          MediumId = mediumId,
        //                          CastId = castId,
        //                          AddressId = addressId
        //                      };

        //    OfficeManagementDataContext.Students.InsertOnSubmit(student);
        //    OfficeManagementDataContext.SubmitChanges();
        //    return student;
        //}

        //public Student UpdateStudent(int studentId, string stuudentName, string mothersName, string fathersName, int age, string gender, int classId, int sectionId, int castId, int mediumId)
        //{
        //    var student = GetStudent(studentId);

        //    student.StudentName = stuudentName;
        //    student.MotherName = mothersName;
        //    student.FatherName = fathersName;
        //    student.Age = age;
        //    student.Gender = gender;
        //    student.Class = classId;
        //    student.SectionId = sectionId;
        //    student.MediumId = mediumId;
        //    student.CastId = castId;
        //    OfficeManagementDataContext.SubmitChanges();
        //    return student;
        //}

        //public bool DeleteStudent(int studentId)
        //{
        //    var student = GetStudent(studentId);
        //    if (student != null)
        //    {
        //        student.IsDeleted = true;
        //        OfficeManagementDataContext.SubmitChanges();
        //        return true;
        //    }
        //    return false;
        //}

        //public Student GetStudent(int studentId)
        //{
        //    return
        //        (from student in OfficeManagementDataContext.Students
        //         where student.StudentId == studentId
        //         select student).FirstOrDefault();
        //}

        //public List<Student> GetActiveStudents(int mediumId, int sectionId, int classId)
        //{
        //    return
        //        (from student in OfficeManagementDataContext.Students
        //         where student.IsDeleted == false
        //         where student.MediumId == mediumId && student.Class == classId && student.SectionId == sectionId
        //         select student).ToList();
        //}

        //#endregion

        //#region FeeMasters

        //public FeeMaster AddFeeMaster(int mediumId, int classId, int fee, int academicYearId)
        //{
        //    var fMaster = GetFeeMasterByMediumIdAndClassIdAndAcademicYearId(mediumId, classId, academicYearId);
        //    if (fMaster == null)
        //    {
        //        var feeMaster = new FeeMaster
        //                            {
        //                                ClassId = classId,
        //                                MediumId = mediumId,
        //                                Fee = fee,
        //                                AcademicYearId = academicYearId
        //                            };
        //        OfficeManagementDataContext.FeeMasters.InsertOnSubmit(feeMaster);
        //        OfficeManagementDataContext.SubmitChanges();
        //        return feeMaster;
        //    }
        //    return null;
        //}

        //public FeeMaster GetFeeMasterByMediumIdAndClassIdAndAcademicYearId(int mediumId, int classId, int academicYearId)
        //{
        //    return
        //        (from feeMaster in OfficeManagementDataContext.FeeMasters
        //         where feeMaster.ClassId == classId && feeMaster.MediumId == mediumId && feeMaster.AcademicYearId == academicYearId
        //         select feeMaster).FirstOrDefault();
        //}

        //public FeeMaster GetCurrentYearFeeMasterByMediumIdAndClassId(int mediumId, int classId)
        //{
        //    return
        //        (from feeMaster in OfficeManagementDataContext.FeeMasters
        //         where feeMaster.ClassId == classId && feeMaster.MediumId == mediumId && feeMaster.AcademicYear.isActive
        //         select feeMaster).FirstOrDefault();
        //}
        //public FeeMaster GetFeeMaster(int id)
        //{
        //    return (from feeMaster in OfficeManagementDataContext.FeeMasters
        //            where feeMaster.Id == id
        //            select feeMaster).FirstOrDefault();
        //}
        //public bool UpdateFeeMaster(int id, int fee)
        //{
        //    var feeMaster = GetFeeMaster(id);
        //    if (feeMaster != null)
        //    {
        //        feeMaster.Fee = fee;
        //        OfficeManagementDataContext.SubmitChanges();
        //        return true;
        //    }
        //    return false;
        //}
        //#endregion

        //#region AcademicYear

        //public AcademicYear GetActiveAcademicYear()
        //{
        //    return
        //        (from academicYear in OfficeManagementDataContext.AcademicYears
        //         where academicYear.isActive
        //         select academicYear).FirstOrDefault();
        //}

        //public AcademicYear GetAcademicYearByStartYear(int yearId)
        //{
        //    return
        //       (from academicYear in OfficeManagementDataContext.AcademicYears
        //        where academicYear.AcademicYearStart.Year == yearId
        //        select academicYear).FirstOrDefault();
        //}

        //public List<AcademicYear> GetAllAcademicYears()
        //{
        //    return
        //        (from academicYear in OfficeManagementDataContext.AcademicYears
        //         select academicYear).ToList();
        //}

        //#endregion

        //#region Account

        //public Account GetAccountByStudentIdAndAcademicYearId(int studentId, int academicYearId)
        //{
        //    return
        //        (from account in OfficeManagementDataContext.Accounts
        //         where account.AcademicYearId == academicYearId && account.StudentId == studentId
        //         select account).FirstOrDefault();
        //}

        //public Account GetAccountByStudentIdAndAcademicYearIdByClassIdByMediumId(int studentId, int academicYearId, int classId, int mediumId)
        //{
        //    return
        //        (from account in OfficeManagementDataContext.Accounts
        //         where account.AcademicYearId == academicYearId && account.StudentId == studentId && account.MediumId == mediumId && account.ClassId == classId
        //         select account).FirstOrDefault();
        //}

        //public Account AddAcoountByStudentIdByAcademicYearIdByClassIdByMediumIdByCarryFarwordFee(int studentId, int academicYearId, int classId, int mediumId, int carryFarwordFee)
        //{
        //    var account = new Account
        //                      {
        //                          StudentId = studentId,
        //                          AcademicYearId = academicYearId,
        //                          ClassId = classId,
        //                          MediumId = mediumId,
        //                          CarryFarwordFee = carryFarwordFee
        //                      };
        //    OfficeManagementDataContext.Accounts.InsertOnSubmit(account);
        //    OfficeManagementDataContext.SubmitChanges();
        //    return account;
        //}

        //public Account UpdateFeePaidForAccountByAccountId(int accountId, int feePaid, int disCount)
        //{
        //    var account = GetAccountByAccount(accountId);
        //    if (account != null)
        //    {
        //        account.FeePaid = account.FeePaid + feePaid;
        //        account.Discount = disCount;
        //        OfficeManagementDataContext.SubmitChanges();
        //        return account;
        //    }
        //    return null;
        //}

        //public Account GetAccountByAccount(int accountId)
        //{
        //    return
        //        (from account in OfficeManagementDataContext.Accounts
        //         where account.AccountId == accountId
        //         select account).FirstOrDefault();


        //}

        //public List<Account> GetFeePendingDetailsByMediumIdByClassId(int mediumId, int classId)
        //{
        //    var activeAccounts = (from account in OfficeManagementDataContext.Accounts
        //                          where account.AcademicYear.isActive && account.MediumId == mediumId && account.ClassId == classId
        //                          select account);


        //    return activeAccounts.ToList();
        //}

        //public void UpdateCurrentYearAccount(int studentId, int classId, int mediumId)
        //{
        //    var activeAccounts = (from account in OfficeManagementDataContext.Accounts
        //                          where account.AcademicYear.isActive && account.StudentId == studentId
        //                          select account).FirstOrDefault();

        //    if (activeAccounts != null)
        //    {
        //        activeAccounts.ClassId = classId;
        //        activeAccounts.MediumId = mediumId;
        //        OfficeManagementDataContext.SubmitChanges();
        //    }
        //}

        //#endregion

        //#region Transaction Details

        //public List<TransactionDetail> GetAllActiveTransactionDetailsByStudentIdByAccountIdByAcademicYearId(int studentId, int accountId, int academicYearId)
        //{
        //    return
        //       (from transactionDetail in OfficeManagementDataContext.TransactionDetails
        //        where transactionDetail.AcademicYearId == academicYearId && transactionDetail.StudentId == studentId && transactionDetail.Approved == true
        //        && transactionDetail.AccountId == accountId
        //        select transactionDetail).ToList();
        //}

        //public TransactionDetail AddTransactionDetail(int accountId, int studentId, int amountPaid, int userId, bool isApproved, int academicYearId)
        //{
        //    var transactionDetail = new TransactionDetail
        //                                {
        //                                    AccountId = accountId,
        //                                    StudentId = studentId,
        //                                    AmountPaid = amountPaid,
        //                                    UserId = userId,
        //                                    Approved = isApproved,
        //                                    AcademicYearId = academicYearId,
        //                                    DatePaid = DateTime.Now,
        //                                    Rejected = false
        //                                };
        //    OfficeManagementDataContext.TransactionDetails.InsertOnSubmit(transactionDetail);
        //    OfficeManagementDataContext.SubmitChanges();
        //    return transactionDetail;

        //}

        //public TransactionDetail GetTransactionDetailByTransactionDetailId(int transactionDetailId)
        //{
        //    return (from transactionDetail in OfficeManagementDataContext.TransactionDetails
        //            where transactionDetail.TransactionDetailsId == transactionDetailId
        //            select transactionDetail).FirstOrDefault();
        //}

        //public TransactionDetail UpdateTransactionDetailByTransactionId(int transactionDetailId, bool isRejected, bool isApproved)
        //{
        //    var transactionDetail = GetTransactionDetailByTransactionDetailId(transactionDetailId);
        //    transactionDetail.Approved = isApproved;
        //    transactionDetail.Rejected = isRejected;
        //    OfficeManagementDataContext.SubmitChanges();
        //    return transactionDetail;
        //}

        //#endregion

        //#region ScholarShipDetails


        //public List<ScholarShipDetail> GetScholarShipDetailsByStudentIdAndAcademicYearId(int studentId, int academicYearId)
        //{
        //    return
        //       (from scholarShipDetails in OfficeManagementDataContext.ScholarShipDetails
        //        where scholarShipDetails.AcademicYearId == academicYearId && scholarShipDetails.StudentId == studentId
        //        select scholarShipDetails).ToList();
        //}

        //public ScholarShipDetail GetScholarShipDetailsByScholarShipDetailsId(int scholarShipDetailsId)
        //{
        //    return
        //       (from scholarShipDetails in OfficeManagementDataContext.ScholarShipDetails
        //        where scholarShipDetails.ScholarShipDetailsId == scholarShipDetailsId
        //        select scholarShipDetails).FirstOrDefault();
        //}

        //public ScholarShipDetail AddScholarShipDetail(int studentId, int scholarShipTypeId, int amountSanctioned, int academicYearId, int userId)
        //{
        //    var scholarShipDetailSelected = GetScholarShipDetailsByStudentIdAndAcademicYearIdByScholarShipTypeId(studentId,
        //                                                                                                  academicYearId,
        //                                                                                                  scholarShipTypeId);
        //    if (scholarShipDetailSelected == null)
        //    {
        //        var scholarShipDetailToAdd = new ScholarShipDetail
        //                                         {
        //                                             StudentId = studentId,
        //                                             AcademicYearId = academicYearId,
        //                                             AmountSanctioned = amountSanctioned,
        //                                             ScholarShipTypeId = scholarShipTypeId,
        //                                             DateSanctioned = DateTime.Now,
        //                                             UserId = userId
        //                                         };
        //        OfficeManagementDataContext.ScholarShipDetails.InsertOnSubmit(scholarShipDetailToAdd);
        //        OfficeManagementDataContext.SubmitChanges();
        //        return scholarShipDetailToAdd;
        //    }
        //    scholarShipDetailSelected.AmountSanctioned = amountSanctioned;
        //    scholarShipDetailSelected.DateSanctioned = DateTime.Now;
        //    scholarShipDetailSelected.UserId = userId;
        //    OfficeManagementDataContext.SubmitChanges();
        //    return scholarShipDetailSelected;
        //}

        //public ScholarShipDetail GetScholarShipDetailsByStudentIdAndAcademicYearIdByScholarShipTypeId(int studentId, int academicYearId, int scholarShipTypeId)
        //{
        //    return
        //    (from scholarShipDetails in OfficeManagementDataContext.ScholarShipDetails
        //     where scholarShipDetails.AcademicYearId == academicYearId && scholarShipDetails.StudentId == studentId && scholarShipDetails.ScholarShipTypeId == scholarShipTypeId
        //     select scholarShipDetails).FirstOrDefault();
        //}

        //public ScholarShipDetail UpdateScholarShipDetailsByScholarShipDetailsId(int scholarShipDetailsId, int amountSanctioned, int userId)
        //{
        //    var scholarShipDetails = GetScholarShipDetailsByScholarShipDetailsId(scholarShipDetailsId);
        //    if (scholarShipDetails != null)
        //    {
        //        scholarShipDetails.AmountSanctioned = amountSanctioned;
        //        scholarShipDetails.UserId = userId;
        //        OfficeManagementDataContext.SubmitChanges();
        //    }
        //    return scholarShipDetails;
        //}

        //#endregion

        //#region SubjectTable

        //public bool RemoveSubjectTableRecordsForClassAndMedium(int classId, int mediumId)
        //{
        //    try
        //    {
        //        var subjectTables = GetAllSubjectTableRecordsForClassAndMedium(classId, mediumId);
        //        if (subjectTables.Any())
        //        {
        //            OfficeManagementDataContext.SubjectTables.DeleteAllOnSubmit(subjectTables);
        //            OfficeManagementDataContext.SubmitChanges();

        //        }
        //        return true;
        //    }
        //    catch (Exception)
        //    {
        //        return false;
        //    }

        //}

        //public List<SubjectTable> GetAllSubjectTableRecordsForClassAndMedium(int classId, int mediumId)
        //{
        //    return (from subjectTable in OfficeManagementDataContext.SubjectTables
        //            where subjectTable.ClassId == classId && subjectTable.MediumId == mediumId
        //            select subjectTable).ToList();
        //}

        //public bool AddAllSubjectTableRecordsForClassAndMedium(List<SubjectTable> subjectTables)
        //{
        //    try
        //    {
        //        if (subjectTables.Any())
        //        {
        //            RemoveSubjectTableRecordsForClassAndMedium(subjectTables.First().ClassId,
        //                                                       subjectTables.First().MediumId);
        //            foreach (var subjectTable in subjectTables)
        //            {
        //                OfficeManagementDataContext.SubjectTables.InsertOnSubmit(new SubjectTable
        //                                                                             {
        //                                                                                 ClassId = subjectTable.ClassId,
        //                                                                                 MediumId = subjectTable.MediumId,
        //                                                                                 SubjectId = subjectTable.SubjectId
        //                                                                             });
        //                OfficeManagementDataContext.SubmitChanges();
        //            }
        //        }
        //        return true;
        //    }
        //    catch (Exception)
        //    {
        //        return false;
        //    }
        //}

        //#endregion

        //#endregion

        #region SqlServer Entities

        #region Users

        public User AddUserAdoNet(string userName, string userEmail, string userPassword, DateTime effectiveDate, DateTime expirationDate, int addressId)
        {

            if (GetAddressByAddressIdAdoNet(addressId) != null)
            {

                var userAdo = TestdbEntities.Users.CreateObject();


                userAdo.UserName = userName;
                userAdo.UserEmail = userEmail;
                userAdo.UserPassword = userPassword;
                userAdo.EffectiveDate = effectiveDate;
                userAdo.ExpirationDate = expirationDate;
                userAdo.AddressId = addressId;
                userAdo.DateAdded = DateTime.Now;
                userAdo.IsDeleted = false;
                TestdbEntities.Users.AddObject(userAdo);
                TestdbEntities.SaveChanges();
                return userAdo;
            }
            return null;
        }

        public User GetUserByIdInAdoNet(int userId)
        {
            return (from us in TestdbEntities.Users where us.UserId == userId select us).FirstOrDefault();

        }

        public User GetActiiveUserByUserEmailInAdoNet(string userEmail)
        {
            return (from us in TestdbEntities.Users
                    where
                        String.Compare(us.UserEmail, userEmail.Trim(), StringComparison.CurrentCultureIgnoreCase) == 0 &&
                        us.IsDeleted == false
                    select us).FirstOrDefault();
        }

        public bool DeleteUserByAdoNet(int userId)
        {
            var user = GetUserByIdInAdoNet(userId);
            if (user != null)
            {
                user.IsDeleted = true;
                TestdbEntities.SaveChanges();
                return true;
            }
            return false;
        }

        #endregion

        #region AdressesAdoNet


        public Address AddAddressByAdoNet(string addressLineOne, string village, string district, string pincode)
        {
            var address = new Address
            {
                AdrressLineOne = addressLineOne,
                Village = village,
                District = district,
                Pincode = pincode
            };
            TestdbEntities.Addresses.AddObject(address);
            TestdbEntities.SaveChanges();
            return address;
        }

        public Address UpdateAddressInAdoNet(int addressId, string addressLineOne, string village, string district, string pincode)
        {
            var address = GetAddressByAddressIdAdoNet(addressId);
            address.AdrressLineOne = addressLineOne;
            address.Village = village;
            address.District = district;
            address.Pincode = pincode;
            TestdbEntities.SaveChanges();
            return address;
        }

        public Address GetAddressByAddressIdAdoNet(int addressId)
        {
            return
                (from adres in TestdbEntities.Addresses
                 where adres.AddressId == addressId
                 select adres).FirstOrDefault();
        }


        #endregion

        #region UserGroupAssociations

        public bool AddUserGroupAssociationByEntityFrameWork(int groupId, int userId)
        {
            try
            {
                var usr = GetUserGroupAssociationsByUserIdByAdoNet(userId);
                usr.UserGroupAssociations.Add(new UserGroupAssociation
                                                  {
                                                      UserId = userId,
                                                      GroupId = groupId
                                                  });
                TestdbEntities.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public User GetUserGroupAssociationsByUserIdByAdoNet(int userId)
        {
            return (from usr in TestdbEntities.Users
                    where usr.UserId == userId
                    select usr).FirstOrDefault();
        }

        public bool IsUserAdminEntityFrameWork(int userId)
        {
            var userGroupAssociations = GetUserGroupAssociationsByUserIdByAdoNet(userId);
            var isAdmin = false;
            foreach (var userGroup in userGroupAssociations.UserGroupAssociations)
            {
                if (userGroup.Group.GroupCode.Equals("Admin"))
                {
                    isAdmin = true;
                }
            }
            return isAdmin;
        }

        public Group GetGroupByGroupIdEntityFrameWork(int groupId)
        {
            return (from @group in TestdbEntities.Groups
                    where @group.GroupId == groupId
                    select @group).FirstOrDefault();
        }


        #endregion

        #region Medium

        public Medium AddMediumByAdoNet(string mName)
        {
            var medium = new Medium
            {
                MediumName = mName
            };
            TestdbEntities.Media.AddObject(medium);
            TestdbEntities.SaveChanges();

            return medium;
        }

        #endregion

        #region Class

        public Class AddClassByAdoNet(string cName)
        {
            var cls = new Class
            {
                ClassName = cName
            };
            TestdbEntities.Classes.AddObject(cls);
            TestdbEntities.SaveChanges();

            return cls;
        }

        #endregion

        #region ExamType

        public ExamType AddExamTypeAdoNet(string cName, int marks, int passingMarks)
        {
            var examType = new ExamType
            {
                ExamName = cName,
                PerSubjectMarks = marks,
                PassingMarksPerSubject = passingMarks
            };

            TestdbEntities.ExamTypes.AddObject(examType);
            TestdbEntities.SaveChanges();

            return examType;
        }

        #endregion

        #region Cast

        public Cast AddCastAdoNet(string cstName)
        {
            var cast = new Cast
            {
                CastName = cstName
            };
            TestdbEntities.Casts.AddObject(cast);
            TestdbEntities.SaveChanges();
            return cast;
        }

        #endregion

        #region Group

        public Group AddGroupAdoNet(string grpCode, string grpDescription)
        {
            var group = new Group
            {
                GroupCode = grpCode,
                GroupDescription = grpDescription
            };
            TestdbEntities.Groups.AddObject(group);
            TestdbEntities.SaveChanges();

            return group;
        }

        #endregion

        #region Student

        public Student AddStudentAdoNet(string stuudentName, string mothersName, string fathersName, int age, string gender, int classId, int sectionId, int castId, int mediumId, int addressId)
        {
            var student = new Student
            {
                StudentName = stuudentName,
                MotherName = mothersName,
                FatherName = fathersName,
                Age = age,
                Gender = gender,
                Class = classId,
                SectionId = sectionId,
                MediumId = mediumId,
                CastId = castId,
                AddressId = addressId
            };

            TestdbEntities.Students.AddObject(student);
            TestdbEntities.SaveChanges();
            return student;
        }

        public Student UpdateStudentAdoNet(int studentId, string stuudentName, string mothersName, string fathersName, int age, string gender, int classId, int sectionId, int castId, int mediumId)
        {
            var student = GetStudentAdoNet(studentId);

            student.StudentName = stuudentName;
            student.MotherName = mothersName;
            student.FatherName = fathersName;
            student.Age = age;
            student.Gender = gender;
            student.Class = classId;
            student.SectionId = sectionId;
            student.MediumId = mediumId;
            student.CastId = castId;
            TestdbEntities.SaveChanges();
            return student;
        }

        public bool DeleteStudentAdoNet(int studentId)
        {
            var student = GetStudentAdoNet(studentId);
            if (student != null)
            {
                student.IsDeleted = true;
                TestdbEntities.SaveChanges();
                return true;
            }
            return false;
        }

        public Student GetStudentAdoNet(int studentId)
        {
            return
                (from student in TestdbEntities.Students
                 where student.StudentId == studentId
                 select student).FirstOrDefault();
        }

        public List<Student> GetActiveStudentsAdoNet(int mediumId, int sectionId, int classId)
        {
            return
                (from @student in TestdbEntities.Students
                 where @student.IsDeleted == false
                 where @student.MediumId == mediumId && @student.Class == classId && @student.SectionId == sectionId
                 select @student).ToList();
        }

        #endregion

        #region FeeMasters

        public FeeMaster AddFeeMasterAdoNet(int mediumId, int classId, int fee, int academicYearId)
        {
            var fMaster = GetFeeMasterByMediumIdAndClassIdAndAcademicYearIdAdoNet(mediumId, classId, academicYearId);
            if (fMaster == null)
            {
                var feeMaster = new FeeMaster
                {
                    ClassId = classId,
                    MediumId = mediumId,
                    Fee = fee,
                    AcademicYearId = academicYearId
                };
                TestdbEntities.FeeMasters.AddObject(feeMaster);
                return feeMaster;
            }
            return null;
        }

        public FeeMaster GetFeeMasterByMediumIdAndClassIdAndAcademicYearIdAdoNet(int mediumId, int classId, int academicYearId)
        {
            return
                (from feeMaster in TestdbEntities.FeeMasters
                 where feeMaster.ClassId == classId && feeMaster.MediumId == mediumId && feeMaster.AcademicYearId == academicYearId
                 select feeMaster).FirstOrDefault();
        }

        public FeeMaster GetCurrentYearFeeMasterByMediumIdAndClassIdAdoNet(int mediumId, int classId)
        {
            return
                (from feeMaster in TestdbEntities.FeeMasters
                 where feeMaster.ClassId == classId && feeMaster.MediumId == mediumId && feeMaster.AcademicYear.isActive
                 select feeMaster).FirstOrDefault();
        }
        public FeeMaster GetFeeMasterAdoNet(int id)
        {
            return (from feeMaster in TestdbEntities.FeeMasters
                    where feeMaster.Id == id
                    select feeMaster).FirstOrDefault();
        }
        public bool UpdateFeeMasterAdoNet(int id, int fee)
        {
            var feeMaster = GetFeeMasterAdoNet(id);
            if (feeMaster != null)
            {
                feeMaster.Fee = fee;
                TestdbEntities.SaveChanges();
                return true;
            }
            return false;
        }
        #endregion

        #region AcademicYear

        public AcademicYear GetActiveAcademicYearAdoNet()
        {
            return
                (from academicYear in TestdbEntities.AcademicYears
                 where academicYear.isActive
                 select academicYear).FirstOrDefault();
        }

        public AcademicYear GetAcademicYearByStartYearAdoNet(int yearId)
        {
            return
               (from academicYear in TestdbEntities.AcademicYears
                where academicYear.AcademicYearStart.Year == yearId
                select academicYear).FirstOrDefault();
        }

        public List<AcademicYear> GetAllAcademicYearsAdoNet()
        {
            return
                (from academicYear in TestdbEntities.AcademicYears
                 select academicYear).ToList();
        }

        #endregion

        #region Account

        public Account GetAccountByStudentIdAndAcademicYearIdAdoNet(int studentId, int academicYearId)
        {
            return
                (from accounts in TestdbEntities.Accounts
                 where accounts.AcademicYearId == academicYearId && accounts.StudentId == studentId
                 select accounts).FirstOrDefault();
        }

        public Account GetAccountByStudentIdAndAcademicYearIdByClassIdByMediumIdAdoNet(int studentId, int academicYearId, int classId, int mediumId)
        {
            return
                (from accounts in TestdbEntities.Accounts
                 where accounts.AcademicYearId == academicYearId && accounts.StudentId == studentId && accounts.MediumId == mediumId && accounts.ClassId == classId
                 select accounts).FirstOrDefault();
        }

        public Account AddAcoountByStudentIdByAcademicYearIdByClassIdByMediumIdByCarryFarwordFeeAdoNet(int studentId, int academicYearId, int classId, int mediumId, int carryFarwordFee)
        {
            var account = new Account
                              {
                                  StudentId = studentId,
                                  AcademicYearId = academicYearId,
                                  ClassId = classId,
                                  MediumId = mediumId,
                                  CarryFarwordFee = carryFarwordFee
                              };
            TestdbEntities.Accounts.AddObject(account);
            TestdbEntities.SaveChanges();
            return account;
        }

        public Account UpdateFeePaidForAccountByAccountIdAdoNet(int accountId, int feePaid, int disCount)
        {
            var account = GetAccountByAccountAdoNet(accountId);
            if (account != null)
            {
                account.FeePaid = account.FeePaid + feePaid;
                account.Discount = disCount;
                TestdbEntities.SaveChanges();
                return account;
            }
            return null;
        }

        public Account GetAccountByAccountAdoNet(int accountId)
        {
            return
                (from accounts in TestdbEntities.Accounts
                 where accounts.AccountId == accountId
                 select accounts).FirstOrDefault();


        }

        public List<Account> GetFeePendingDetailsByMediumIdByClassIdAdoNet(int mediumId, int classId)
        {
            var activeAccounts = (from accounts in TestdbEntities.Accounts
                                  where accounts.AcademicYear.isActive && accounts.MediumId == mediumId && accounts.ClassId == classId
                                  select accounts);


            return activeAccounts.ToList();
        }

        public void UpdateCurrentYearAccountAdoNet(int studentId, int classId, int mediumId)
        {
            var activeAccounts = (from account in TestdbEntities.Accounts
                                  where account.AcademicYear.isActive && account.StudentId == studentId
                                  select account).FirstOrDefault();

            if (activeAccounts != null)
            {
                activeAccounts.ClassId = classId;
                activeAccounts.MediumId = mediumId;
                TestdbEntities.SaveChanges();
            }
        }

        #endregion

        #region Transaction Details

        public List<TransactionDetail> GetAllActiveTransactionDetailsByStudentIdByAccountIdByAcademicYearIdAdoNet(int studentId, int accountId, int academicYearId)
        {
            return
               (from transactionDetail in TestdbEntities.TransactionDetails
                where transactionDetail.AcademicYearId == academicYearId && transactionDetail.StudentId == studentId && transactionDetail.Approved == true
                && transactionDetail.AccountId == accountId
                select transactionDetail).ToList();
        }

        public TransactionDetail AddTransactionDetailAdoNet(int accountId, int studentId, int amountPaid, int userId, bool isApproved, int academicYearId)
        {
            var transactionDetail = new TransactionDetail
            {
                AccountId = accountId,
                StudentId = studentId,
                AmountPaid = amountPaid,
                UserId = userId,
                Approved = isApproved,
                AcademicYearId = academicYearId,
                DatePaid = DateTime.Now,
                Rejected = false
            };
            TestdbEntities.TransactionDetails.AddObject(transactionDetail);
            TestdbEntities.SaveChanges();
            return transactionDetail;

        }

        public TransactionDetail GetTransactionDetailByTransactionDetailIdAdoNet(int transactionDetailId)
        {
            return (from transactionDetail in TestdbEntities.TransactionDetails
                    where transactionDetail.TransactionDetailsId == transactionDetailId
                    select transactionDetail).FirstOrDefault();
        }

        public TransactionDetail UpdateTransactionDetailByTransactionIdAdoNet(int transactionDetailId, bool isRejected, bool isApproved)
        {
            var transactionDetail = GetTransactionDetailByTransactionDetailIdAdoNet(transactionDetailId);
            transactionDetail.Approved = isApproved;
            transactionDetail.Rejected = isRejected;
            TestdbEntities.SaveChanges();
            return transactionDetail;
        }

        #endregion

        #region ScholarShipDetails

        public List<ScholarShipDetail> GetScholarShipDetailsByStudentIdAndAcademicYearIdAdoNet(int studentId, int academicYearId)
        {
            return
               (from scholarShipDetails in TestdbEntities.ScholarShipDetails
                where scholarShipDetails.AcademicYearId == academicYearId && scholarShipDetails.StudentId == studentId
                select scholarShipDetails).ToList();
        }

        public ScholarShipDetail GetScholarShipDetailsByScholarShipDetailsIdAdoNet(int scholarShipDetailsId)
        {
            return
               (from scholarShipDetails in TestdbEntities.ScholarShipDetails
                where scholarShipDetails.ScholarShipDetailsId == scholarShipDetailsId
                select scholarShipDetails).FirstOrDefault();
        }

        public ScholarShipDetail AddScholarShipDetailAdoNet(int studentId, int scholarShipTypeId, int amountSanctioned, int academicYearId, int userId)
        {
            var scholarShipDetailSelected = GetScholarShipDetailsByStudentIdAndAcademicYearIdByScholarShipTypeIdAdoNet(studentId,
                                                                                                          academicYearId,
                                                                                                          scholarShipTypeId);
            if (scholarShipDetailSelected == null)
            {
                var scholarShipDetailToAdd = new ScholarShipDetail
                {
                    StudentId = studentId,
                    AcademicYearId = academicYearId,
                    AmountSanctioned = amountSanctioned,
                    ScholarShipTypeId = scholarShipTypeId,
                    DateSanctioned = DateTime.Now,
                    UserId = userId
                };
                TestdbEntities.ScholarShipDetails.AddObject(scholarShipDetailToAdd);
                return scholarShipDetailToAdd;
            }
            scholarShipDetailSelected.AmountSanctioned = amountSanctioned;
            scholarShipDetailSelected.DateSanctioned = DateTime.Now;
            scholarShipDetailSelected.UserId = userId;
            TestdbEntities.SaveChanges();
            return scholarShipDetailSelected;
        }

        public ScholarShipDetail GetScholarShipDetailsByStudentIdAndAcademicYearIdByScholarShipTypeIdAdoNet(int studentId, int academicYearId, int scholarShipTypeId)
        {
            return
            (from scholarShipDetails in TestdbEntities.ScholarShipDetails
             where scholarShipDetails.AcademicYearId == academicYearId && scholarShipDetails.StudentId == studentId && scholarShipDetails.ScholarShipTypeId == scholarShipTypeId
             select scholarShipDetails).FirstOrDefault();
        }

        public ScholarShipDetail UpdateScholarShipDetailsByScholarShipDetailsIdAdoNet(int scholarShipDetailsId, int amountSanctioned, int userId)
        {
            var scholarShipDetails = GetScholarShipDetailsByScholarShipDetailsIdAdoNet(scholarShipDetailsId);
            if (scholarShipDetails != null)
            {
                scholarShipDetails.AmountSanctioned = amountSanctioned;
                scholarShipDetails.UserId = userId;
                TestdbEntities.SaveChanges();
            }
            return scholarShipDetails;
        }

        #endregion

        #region SubjectTable

        public bool RemoveSubjectTableRecordsForClassAndMediumAdoNet(int classId, int mediumId)
        {
            try
            {
                var subjectTables = GetAllSubjectTableRecordsForClassAndMediumAdoNet(classId, mediumId);
                if (subjectTables.Any())
                {
                    foreach (var subjectTable in subjectTables)
                    {
                        TestdbEntities.SubjectTables.DeleteObject(subjectTable);
                        TestdbEntities.SaveChanges();

                    }

                }
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }

        public List<SubjectTable> GetAllSubjectTableRecordsForClassAndMediumAdoNet(int classId, int mediumId)
        {
            return (from subjectTable in TestdbEntities.SubjectTables
                    where subjectTable.ClassId == classId && subjectTable.MediumId == mediumId
                    select subjectTable).ToList();
        }

        public bool AddAllSubjectTableRecordsForClassAndMediumAdoNet(List<SubjectTable> subjectTables)
        {
            try
            {
                if (subjectTables.Any())
                {
                    RemoveSubjectTableRecordsForClassAndMediumAdoNet(subjectTables.First().ClassId,
                                                               subjectTables.First().MediumId);
                    foreach (var subjectTable in subjectTables)
                    {
                        TestdbEntities.SubjectTables.AddObject(new SubjectTable
                        {
                            ClassId = subjectTable.ClassId,
                            MediumId = subjectTable.MediumId,
                            SubjectId = subjectTable.SubjectId
                        });
                        TestdbEntities.SaveChanges();
                    }
                }
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        #endregion

        #region Section

        public Section AddSectionByEntityFrameWork(string sName)
        {
            var section = new Section
            {
                SectionName = sName
            };
            TestdbEntities.Sections.AddObject(section);
            TestdbEntities.SaveChanges();
            return section;
        }

        #endregion

        #region SubjectMaster

        public SubjectMaster AddSubjectByEntityFrameWork(string sName)
        {
            if (GetSubjectByNameByEntityFrameWork(sName) != null)
                return null;
            var subjectType = new SubjectMaster
            {
                SubjectName = sName,

            };
            TestdbEntities.SubjectMasters.AddObject(subjectType);
            TestdbEntities.SaveChanges();
            return subjectType;
        }

        public SubjectMaster GetSubjectByNameByEntityFrameWork(string sName)
        {
            return (from subjectMaster in TestdbEntities.SubjectMasters
                    where
                        subjectMaster.SubjectName.Equals(sName.Trim())
                    select subjectMaster).FirstOrDefault();
        }


        #endregion

        #endregion
        
    }
}
