module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | ShprittzScheduler"
    end
  end
end
