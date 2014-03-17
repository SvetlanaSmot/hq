class Curator::TaskUser < ActiveRecord::Base
  self.table_name = 'curator_task_user'

  STATUS_NEVER_SAW = 1
  STATUS_SAW = 2
  STATUS_FINISHED = 3
  STATUS_REOPENED = 4

  belongs_to :task, class_name: Curator::Task, foreign_key: :curator_task_id
  belongs_to :user, foreign_key: :user_id

  def phase
    case status
      when STATUS_NEVER_SAW
        {text: 'не приступил', color: 'danger'}
      when STATUS_SAW
        {text: 'приступил', color: 'default'}
      when STATUS_FINISHED
        {text: 'завершено', color: 'success'}
      when STATUS_REOPENED
        {text: 'заново открыто', color: 'warning'}
    end
  end

  def finished?
    STATUS_FINISHED == status
  end
end