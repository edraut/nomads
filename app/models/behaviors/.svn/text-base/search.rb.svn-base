module Search
  def self.included(klass)
    klass.extend(ClassMethods)
  end

  module ClassMethods
    def conditions_from_search_terms(search_terms)
      puts search_terms
      raw_terms = Shellwords::shellwords(search_terms)
      column_names = self.search_columns
      must_have_terms = raw_terms.collect{|t| (t =~ /^\+(.+)/) ? (raw_terms.delete(t); $1) : nil}.compact
      must_not_terms = raw_terms.collect{|t| (t =~ /^\-(.+)/) ?  (raw_terms.delete(t); $1) : nil}.compact
      optional_terms = raw_terms

      query = self.query
      must_have_terms.each_with_index do |term, index|
        must_term_conditions = query.or
        column_names.each do |column_name|
          must_term_conditions.ilike(column_name,'%' + term + '%')
        end
      end
      must_not_terms.each_with_index do |term,index|
        must_not_conditions = query.and
        column_names.each do |column_name|
          must_not_conditions.ne(column_name,term)
        end
      end
      optional_conditions = query.or
      optional_terms.each_with_index do |term,index|
        column_names.each do |column_name|
          optional_conditions.ilike(column_name,'%' + term + '%')
        end
      end
      conditions_sql = query.conditions
      search_params = query.parameters
      return conditions_sql, *search_params
    end
  end
end
