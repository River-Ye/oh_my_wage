module ApplicationHelper
  
  def flash_class(level)
    case level
      when :notice then "alert alert-info"
    end
  end

  def calculate_student_salary_hr
    # studetnt/index
    # studetnt/history
    @salary.map{ |salary| salary.hr }.sum
  end

  def calculate_studen_salary_sum
    # studetnt/index
    # studetnt/history
    @salary.map{ |salary| salary.hr * salary.hourly_wage }.sum
  end

  def money(salary)
    # staff/salaries/show
    # student/user/history
    salary.hr * salary.hourly_wage
  end
end