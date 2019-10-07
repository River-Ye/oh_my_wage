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
    @salary.map{ |salary| salary.hr }.sum
  end
end
