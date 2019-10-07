module Staff::SalariesHelper
  def calculate_salary_hr
    # staff/salaries/show
    @salary_all.map{ |salary| salary.hr }.sum
  end

  def calculate_salary_sum
    # staff/salaries/show
    @salary_all.map{ |salary| salary.hourly_wage * salary.hr }.sum
  end

  def salary_hr(student)
    # staff/salaries/index
    student.salaries.this_month.map{ |salary| salary.hr }.sum
  end

  def salary_sum(student)
    # staff/salaries/index
    student.salaries.this_month.map{ |salary| salary.hourly_wage * salary.hr }.sum
  end
end