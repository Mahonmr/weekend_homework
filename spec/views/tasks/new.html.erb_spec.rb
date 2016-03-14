require 'rails_helper'

RSpec.describe "tasks/new", type: :view do
  before(:each) do
    assign(:task, Task.new(
      :description => "MyString",
      :list_id => 1
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do

      assert_select "input#task_description[name=?]", "task[description]"

      assert_select "input#task_list_id[name=?]", "task[list_id]"
    end
  end
end
