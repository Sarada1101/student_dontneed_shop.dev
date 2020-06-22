package shop.model.service;

import shop.model.dao.UserDao;

public class UserService extends CommonService {


	public boolean checkMemberMailExists(String memberMail ) {

		UserDao userDao = new UserDao();

		boolean exists = userDao.checkMemberMailExists(memberMail);

		return exists;

	}





	public boolean insertMember(MemberBeans membeerBeans){

		UserDao userDao = new UserDao();

		boolean couldInsert = userDao.insertMember(membeerBeans);

		return couldInsert;
	}


}
