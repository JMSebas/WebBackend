require "test_helper"

class SubjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subject = subjects(:one)
  end

  test "should get index" do
    get subjects_url, as: :json
    assert_response :success
  end

  test "should create subject" do
    assert_difference("Subject.count") do
      post subjects_url, params: { subject: { credits: @subject.credits, final_grade: @subject.final_grade, name: @subject.name, professor: @subject.professor, schedule_id: @subject.schedule_id, semester_id: @subject.semester_id, status: @subject.status } }, as: :json
    end

    assert_response :created
  end

  test "should show subject" do
    get subject_url(@subject), as: :json
    assert_response :success
  end

  test "should update subject" do
    patch subject_url(@subject), params: { subject: { credits: @subject.credits, final_grade: @subject.final_grade, name: @subject.name, professor: @subject.professor, schedule_id: @subject.schedule_id, semester_id: @subject.semester_id, status: @subject.status } }, as: :json
    assert_response :success
  end

  test "should destroy subject" do
    assert_difference("Subject.count", -1) do
      delete subject_url(@subject), as: :json
    end

    assert_response :no_content
  end
end
