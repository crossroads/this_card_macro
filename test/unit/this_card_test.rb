require File.join(File.dirname(__FILE__), 'unit_test_helper')

class ThisCardMacroTest < Test::Unit::TestCase

  FIXTURE = 'sample'

  def test_macro_contents
    params = {'attribute' => "Created for"}
    Mingle::Project.any_instance.stubs(:execute_mql).returns(
      [{'created_for' => "ndbroadbent"}]
    )
    create_defect = ThisCardMacro.new(params, project(FIXTURE), nil)
    result = create_defect.execute
    assert create_defect.execute == "ndbroadbent"

    # ----------------------------------------------------------------

    params = {'attribute' => "Number"}
    Mingle::Project.any_instance.stubs(:execute_mql).returns(
      [{'number' => "12234"}]
    )
    create_defect = ThisCardMacro.new(params, project(FIXTURE), nil)
    result = create_defect.execute
    assert create_defect.execute == "12234"

  end

end

