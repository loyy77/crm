package org.crm.web.controller.support.converter;

import org.crm.biz.UsersBiz;
import org.crm.entity.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.convert.converter.Converter;

@ComponentScan
public class StringToUsersConverter implements Converter<String, Users> {
	@Autowired
	private UsersBiz usersBiz;
	@Override
	public Users convert(String s) {
		Integer id = new Integer(s);
		Users u = usersBiz.getById(id);

		return u;
	}


}
