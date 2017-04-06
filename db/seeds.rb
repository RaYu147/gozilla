# --- coding: utf-8 ---

table_names = %w(accounts year_managements test_basic_infos question_infos test_infos question_choice_infos exam_infos exam_answers)
table_names.each do |table_name|
  path = Rails.root.join('db', 'seeds', Rails.env, "#{table_name}.rb")
  if File.exist?(path)
    puts "Creating #{table_name}...."
    require(path)
  end
end
