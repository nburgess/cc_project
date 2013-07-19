# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :distance_essential do
    user nil
    team nil
    date "2013-07-19"
    diet_quality 1
    hours_of_sleep 1
    minutes_run 1
    minutes_streching 1
    minutes_icing 1
    core_strength 1
    upper_body_weights 1
    minutes_cross_training 1
  end
end
