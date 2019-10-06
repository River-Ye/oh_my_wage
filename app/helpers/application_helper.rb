module ApplicationHelper
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