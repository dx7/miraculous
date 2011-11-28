# -*- encoding: utf-8 -*-
require "rspec/expectations"

validations = {
  validate_presence_of: ActiveModel::Validations::PresenceValidator,
  validate_uniqueness_of: ActiveRecord::Validations::UniquenessValidator,
  validate_associated_of: ActiveRecord::Validations::AssociatedValidator,
  validate_length_of: ActiveModel::Validations::LengthValidator,
  validate_inclusion_of: ActiveModel::Validations::InclusionValidator,
  validate_numericality_of: ActiveModel::Validations::NumericalityValidator
}

validations.each do |validator_method, validator_class|
  RSpec::Matchers.define validator_method do |attr, options|
    options ||= {}
    options.reverse_merge!(:case_sensitive => true) if validator_method == :validate_uniqueness_of

    match do |current_subject|
      main_class = current_subject.kind_of?(Class) ? current_subject : current_subject.class
      validator_options = {}
      validator_found = false

      main_class.validators_on(attr).each do |validator|
        next unless validator.is_a?(validator_class)
        validator_found = true
        validator_options.merge!(validator.instance_variable_get('@options'))
      end

      validator_found.should be_true
      validator_options.should == options
    end
  end
end
