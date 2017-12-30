package com.test.dto;

public class FilterDTO
{
	private String category_code, cityPe_id, grPublic_id, sort, group_name, city_name, category_content, grPublic_name;

	private int startNum, endNum;
	
	
	
	public String getCategory_code()
	{
		return category_code;
	}

	public void setCategory_code(String category_code)
	{
		this.category_code = category_code;
	}

	public String getCategory_content()
	{
		return category_content;
	}

	public void setCategory_content(String category_content)
	{
		this.category_content = category_content;
	}

	public String getGrPublic_name()
	{
		return grPublic_name;
	}

	public void setGrPublic_name(String grPublic_name)
	{
		this.grPublic_name = grPublic_name;
	}

	public String getCity_name()
	{
		return city_name;
	}

	public void setCity_name(String city_name)
	{
		this.city_name = city_name;
	}

	public int getStartNum()
	{
		return startNum;
	}

	public void setStartNum(int startNum)
	{
		this.startNum = startNum;
	}

	public int getEndNum()
	{
		return endNum;
	}

	public void setEndNum(int endNum)
	{
		this.endNum = endNum;
	}

	public String getGroup_name()
	{
		return group_name;
	}

	public void setGroup_name(String group_name)
	{
		this.group_name = group_name;
	}

	public String getCityPe_id()
	{
		return cityPe_id;
	}

	public void setCityPe_id(String cityPe_id)
	{
		this.cityPe_id = cityPe_id;
	}

	public String getGrPublic_id()
	{
		return grPublic_id;
	}

	public void setGrPublic_id(String grPublic_id)
	{
		this.grPublic_id = grPublic_id;
	}

	public String getSort()
	{
		return sort;
	}

	public void setSort(String sort)
	{
		this.sort = sort;
	}
}
