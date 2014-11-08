class UserDatatable < AjaxDatatablesRails::Base
  # uncomment the appropriate paginator module,
  # depending on gems available in your project.
  include AjaxDatatablesRails::Extensions::Kaminari
  include ApplicationHelper
  # include AjaxDatatablesRails::Extensions::WillPaginate
  # include AjaxDatatablesRails::Extensions::SimplePaginator

  def_delegator :@view, :best_in_place
  def_delegator :@view,:params
  def sortable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.name'
    @sortable_columns ||= ['users.name' ,'users.phone']

  end

  def searchable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.name'
    @searchable_columns ||= ['users.name' ,'users.phone']
  end

  private

  def data
    records.map do |record|
      [
        (best_in_place  record, :name, :type => :input),
        #(best_in_place_format(record,"phone","Click me to add content!","user","input")),
        ('<span class="best_in_place" data-bip-attribute="phone" data-bip-object="user" data-bip-placeholder="Click me to add content!" data-bip-type="input" data-bip-url="/users/'+record.id.to_s+'" id="best_in_place_user_'+record.id.to_s+'_phone">'+ if record.phone.present? then record.phone else "Click me to add content!" end +'</span>'),
        #(best_in_place  record, :phone, :type => :input, :nil => "Click me to add content!"),
        #('<span class="best_in_place" data-bip-attribute="address" data-bip-object="user" data-bip-placeholder="Click me to add content!" data-bip-type="input" data-bip-url="/users/'+record.id.to_s+'" id="best_in_place_user_'+record.id.to_s+'_address">'+ if record.address.present? then record.address else "Click me to add content!" end +'</span>'),
        (best_in_place  record, :address, :type => :input)
        # comma separated list of the values for each cell of a table row
        # example: record.attribute,
      ]
    end
  end

  def get_raw_records
    User.all
  end

  

  # ==== Insert 'presenter'-like methods below if necessary
end
