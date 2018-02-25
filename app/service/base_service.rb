class BaseService
  def call
    process!

  rescue ActiveRecord::RecordInvalid,
         ActiveRecord::StatementInvalid,
         ActiveRecord::RecordNotUnique,
         ActiveRecord::RecordNotSaved => e
    false
  end
end
