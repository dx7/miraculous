# -*- encoding: utf-8 -*-
require "rspec/expectations"

associations_and_matchers = {
  belongs_to: 'belong_to',
  has_many: 'have_many',
  has_one: 'have_one'
}

associations_and_matchers.each do |association_type, association_matcher|
  RSpec::Matchers.define association_matcher do |associated_class, options|
    options ||= {}
    options.reverse_merge!(:extend => []) if association_type == :has_many

    match do |current_subject|
      main_class = current_subject.kind_of?(Class) ? current_subject : current_subject.class

      association = main_class.reflect_on_association(associated_class.to_sym)
      association.should_not be_nil
      association.macro.should == association_type

      association_options = association.options

      association_options.should == options
    end
  end
end
