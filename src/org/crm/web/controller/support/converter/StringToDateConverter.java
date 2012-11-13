package org.crm.web.controller.support.converter;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

public class StringToDateConverter implements Converter<String, Date> {

	@Override
	public Date convert(String arg0) {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			return format.parse(arg0);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

}
