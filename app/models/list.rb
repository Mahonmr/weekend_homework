class List < ActiveRecord::Base
  has_many :tasks

  before_destroy :destroy_tasks

  validates :name, :presence => true

  private

  def destroy_tasks
    self.tasks.destroy_all
  end
end
