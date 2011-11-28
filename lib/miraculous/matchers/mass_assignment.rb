# -*- encoding: utf-8 -*-
require "rspec/expectations"

RSpec::Matchers.define :allow_mass_assignment_of do |*options|
  options.sort!

  match do |current_subject|
    main_class = current_subject.kind_of?(Class) ? current_subject : current_subject.class
    accessible_attributes = main_class.accessible_attributes.to_a.map(&:to_sym).sort
    accessible_attributes.should == options
  end
end
