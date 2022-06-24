package com.jstl;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data //기본생성자, getter/setter, toString, ...
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor

public class PersonDTO {
	@NonNull
	private String name;
	private int age;
}
