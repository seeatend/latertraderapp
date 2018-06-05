require "administrate/base_dashboard"

class BuyerDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    business_name: Field::String,
    buyer_type: Field::String,
    code: Field::String,
    status: Field::String,
    account_type: Field::String,
    business_legal_name: Field::String,
    owner: Field::String,
    market_location: Field::String,
    owner_title: Field::String,
    mobile: Field::String,
    buyer_email: Field::String,
    office_phone: Field::String,
    owner_mobile_no: Field::String,
    owner_email: Field::String,
    alternative_contact_name: Field::String,
    alternative_title: Field::String,
    alternative_mobile_number: Field::String,
    fax: Field::String,
    web: Field::String,
    office_address: Field::Text,
    shipping_address: Field::Text,
    warehouse_address: Field::Text,
    billing_address: Field::Text,
    logo_for_customer_area: Field::String,
    logo_for_invoices: Field::String,
    approved_by: Field::String,
    member_of_smcs: Field::Boolean,
    smcs_no: Field::String,
    abn_no: Field::String,
    tax_file_no: Field::String,
    other: Field::String,
    certificates: Field::String,
    bank_account_type: Field::String,
    bank_name: Field::String,
    bank_address: Field::String,
    account_name: Field::String,
    account_number: Field::String,
    swift_code: Field::String,
    wire_transfer_code: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :business_name,
    :buyer_type,
    :code,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :business_name,
    :buyer_type,
    :code,
    :status,
    :account_type,
    :business_legal_name,
    :owner,
    :market_location,
    :owner_title,
    :mobile,
    :buyer_email,
    :office_phone,
    :owner_mobile_no,
    :owner_email,
    :alternative_contact_name,
    :alternative_title,
    :alternative_mobile_number,
    :fax,
    :web,
    :office_address,
    :shipping_address,
    :warehouse_address,
    :billing_address,
    :logo_for_customer_area,
    :logo_for_invoices,
    :approved_by,
    :member_of_smcs,
    :smcs_no,
    :abn_no,
    :tax_file_no,
    :other,
    :certificates,
    :bank_account_type,
    :bank_name,
    :bank_address,
    :account_name,
    :account_number,
    :swift_code,
    :wire_transfer_code,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :business_name,
    :buyer_type,
    :code,
    :status,
    :account_type,
    :business_legal_name,
    :owner,
    :market_location,
    :owner_title,
    :mobile,
    :buyer_email,
    :office_phone,
    :owner_mobile_no,
    :owner_email,
    :alternative_contact_name,
    :alternative_title,
    :alternative_mobile_number,
    :fax,
    :web,
    :office_address,
    :shipping_address,
    :warehouse_address,
    :billing_address,
    :logo_for_customer_area,
    :logo_for_invoices,
    :approved_by,
    :member_of_smcs,
    :smcs_no,
    :abn_no,
    :tax_file_no,
    :other,
    :certificates,
    :bank_account_type,
    :bank_name,
    :bank_address,
    :account_name,
    :account_number,
    :swift_code,
    :wire_transfer_code,
  ].freeze

  # Overwrite this method to customize how buyers are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(buyer)
  #   "Buyer ##{buyer.id}"
  # end
end
