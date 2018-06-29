# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180629073353) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string   "name",        null: false
    t.integer  "record_id",   null: false
    t.string   "record_type", null: false
    t.integer  "blob_id",     null: false
    t.datetime "created_at",  null: false
  end

  add_index "active_storage_attachments", ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string   "key",                    null: false
    t.string   "filename",               null: false
    t.string   "content_type"
    t.text     "metadata"
    t.integer  "byte_size",    limit: 8, null: false
    t.string   "checksum",               null: false
    t.datetime "created_at",             null: false
  end

  add_index "active_storage_blobs", ["key"], name: "index_active_storage_blobs_on_key", unique: true

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "b2b_ordered_items", force: :cascade do |t|
    t.integer  "b2b_order_id"
    t.integer  "seller_id"
    t.integer  "poi_id"
    t.integer  "offer_id"
    t.integer  "quantity"
    t.integer  "value"
    t.string   "o_status"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "consignment_number"
    t.string   "transport_contact_number"
    t.string   "transport_contact_name"
    t.string   "note_to_buyer"
    t.integer  "paid_amount"
    t.datetime "payment_done_date"
    t.string   "payment_confirmed_by"
  end

  add_index "b2b_ordered_items", ["b2b_order_id"], name: "index_b2b_ordered_items_on_b2b_order_id"
  add_index "b2b_ordered_items", ["offer_id"], name: "index_b2b_ordered_items_on_offer_id"
  add_index "b2b_ordered_items", ["seller_id"], name: "index_b2b_ordered_items_on_seller_id"

  create_table "b2b_orders", force: :cascade do |t|
    t.integer  "seller_id"
    t.string   "o_status"
    t.string   "shipping_address"
    t.string   "total_due"
    t.string   "invoice_number"
    t.integer  "poi_id"
    t.datetime "item_shipped_date"
    t.string   "consignment_number"
    t.string   "transport_contact_name"
    t.string   "transport_contact_number"
    t.string   "item_received_by"
    t.string   "item_received_by_number"
    t.datetime "payment_done_date"
    t.datetime "payment_confirmed_date"
    t.string   "note_to_buyer"
    t.integer  "quantity"
    t.integer  "paid_amount"
    t.string   "payment_type"
    t.string   "shipping_type"
    t.string   "drop_off_point"
    t.string   "pick_up_point"
    t.string   "different_drop_location"
    t.string   "different_shipping_location"
    t.string   "packing_done"
    t.string   "packing_done_by"
    t.string   "otype"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.datetime "order_approved_date"
  end

  add_index "b2b_orders", ["seller_id"], name: "index_b2b_orders_on_seller_id"

  create_table "carts", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "offer_id"
    t.boolean  "o_status"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "seller_id"
    t.integer  "quantity"
    t.string   "note_to_seller"
    t.string   "payment_type"
    t.string   "shipping_type"
    t.string   "drop_off_point"
    t.string   "pick_up_point"
    t.string   "different_drop_location"
    t.string   "otype"
    t.string   "different_shipping_location"
    t.datetime "dropoffdateandtime"
    t.datetime "pickupdateandtime"
  end

  add_index "carts", ["customer_id"], name: "index_carts_on_customer_id"
  add_index "carts", ["offer_id"], name: "index_carts_on_offer_id"
  add_index "carts", ["seller_id"], name: "index_carts_on_seller_id"

  create_table "chats", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "customer_id"
    t.integer  "seller_id"
    t.text     "message"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "offer_id"
    t.string   "title"
  end

  add_index "chats", ["customer_id"], name: "index_chats_on_customer_id"
  add_index "chats", ["offer_id"], name: "index_chats_on_offer_id"
  add_index "chats", ["order_id"], name: "index_chats_on_order_id"
  add_index "chats", ["seller_id"], name: "index_chats_on_seller_id"

  create_table "cheps", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "order_id"
    t.datetime "delivery_date"
    t.integer  "chep_issued"
    t.integer  "chep_due"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "invoice_number"
    t.string   "chep_type"
    t.integer  "chep_received"
  end

  add_index "cheps", ["customer_id"], name: "index_cheps_on_customer_id"
  add_index "cheps", ["order_id"], name: "index_cheps_on_order_id"

  create_table "claim_wastages", force: :cascade do |t|
    t.integer  "stock_id"
    t.integer  "employee_id"
    t.decimal  "wasted_stock_value"
    t.decimal  "waste_checking_labour_cost"
    t.decimal  "total_Waste_claim"
    t.string   "image"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "claim_wastages", ["employee_id"], name: "index_claim_wastages_on_employee_id"
  add_index "claim_wastages", ["stock_id"], name: "index_claim_wastages_on_stock_id"

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "mobile"
    t.string   "email"
    t.string   "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credits", force: :cascade do |t|
    t.integer  "order_id"
    t.decimal  "value"
    t.string   "ctype"
    t.string   "status"
    t.integer  "employee_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "approved_by"
    t.string   "note_to_buyer"
    t.decimal  "requested"
    t.decimal  "extended"
    t.decimal  "utilised"
  end

  add_index "credits", ["employee_id"], name: "index_credits_on_employee_id"
  add_index "credits", ["order_id"], name: "index_credits_on_order_id"

  create_table "customers", force: :cascade do |t|
    t.string   "business_name"
    t.string   "buyer_type"
    t.string   "code"
    t.string   "status"
    t.string   "account_type"
    t.string   "business_legal_name"
    t.string   "owner"
    t.string   "market_location"
    t.string   "owner_title"
    t.string   "mobile"
    t.string   "buyer_email"
    t.string   "office_phone"
    t.string   "owner_mobile_no"
    t.string   "owner_email"
    t.string   "alternative_contact_name"
    t.string   "alternative_title"
    t.string   "alternative_mobile_number"
    t.string   "fax"
    t.string   "web"
    t.text     "office_address"
    t.text     "shipping_address"
    t.text     "warehouse_address"
    t.text     "billing_address"
    t.string   "logo_for_customer_area"
    t.string   "logo_for_invoices"
    t.string   "approved_by"
    t.boolean  "member_of_smcs"
    t.string   "smcs_no"
    t.string   "abn_no"
    t.string   "tax_file_no"
    t.string   "other"
    t.string   "certificates"
    t.string   "bank_account_type"
    t.string   "bank_name"
    t.string   "bank_address"
    t.string   "account_name"
    t.string   "account_number"
    t.string   "swift_code"
    t.string   "wire_transfer_code"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "uid"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "zip"
    t.string   "market_drop_off_location"
    t.decimal  "credit_limit"
    t.integer  "in_network_of"
    t.decimal  "credit_utilized"
    t.decimal  "credit_available"
    t.decimal  "credit_due"
    t.string   "credit_type"
    t.string   "Coop_type"
    t.string   "Coop_ref_no"
    t.string   "credit_terms"
    t.boolean  "coop_credit"
    t.decimal  "coop_credit_limit"
    t.decimal  "coop_credit_utilized"
    t.decimal  "coop_credit_available"
    t.decimal  "coop_credit_due"
    t.integer  "chep_issued"
    t.integer  "chep_due"
    t.integer  "chep_received"
    t.string   "in_chep_network_of"
  end

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.string   "mobile"
    t.string   "email"
    t.string   "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "seller_id"
    t.string   "status"
  end

  add_index "employees", ["seller_id"], name: "index_employees_on_seller_id"

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "seller_id"
    t.integer  "customer_id"
    t.decimal  "ratings"
    t.text     "message"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "feedbacks", ["customer_id"], name: "index_feedbacks_on_customer_id"
  add_index "feedbacks", ["seller_id"], name: "index_feedbacks_on_seller_id"

  create_table "forklifts", force: :cascade do |t|
    t.integer  "employee_id"
    t.string   "priority"
    t.integer  "customer_id"
    t.integer  "order_id"
    t.string   "pick_up_location"
    t.datetime "pick_up_date_and_time"
    t.string   "drop_location"
    t.datetime "drop_date_and_time"
    t.string   "note_to_operator"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "invoice"
    t.string   "status"
    t.string   "image"
    t.integer  "chep_received"
    t.integer  "chep_issued"
    t.integer  "chep_due"
  end

  add_index "forklifts", ["customer_id"], name: "index_forklifts_on_customer_id"
  add_index "forklifts", ["employee_id"], name: "index_forklifts_on_employee_id"
  add_index "forklifts", ["order_id"], name: "index_forklifts_on_order_id"

  create_table "growers", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "mobile_number"
    t.string   "telephone_number"
    t.string   "growers_email_id"
    t.string   "certificates"
    t.string   "company"
    t.string   "zip_code"
    t.boolean  "smcs_member"
    t.decimal  "balance"
    t.decimal  "order_to_date"
    t.string   "status"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "zip"
    t.integer  "seller_id"
  end

  add_index "growers", ["seller_id"], name: "index_growers_on_seller_id"

  create_table "invites", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "mobile"
    t.string   "business_number"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "marketplaces", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "chat_id"
    t.string   "ctype"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "messages", ["chat_id"], name: "index_messages_on_chat_id"

  create_table "networks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "seller_id"
    t.integer  "order_id"
    t.integer  "offer_id"
    t.integer  "stock_id"
    t.integer  "product_id"
    t.integer  "chat_id"
    t.string   "content"
    t.string   "ntype"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "notifications", ["chat_id"], name: "index_notifications_on_chat_id"
  add_index "notifications", ["customer_id"], name: "index_notifications_on_customer_id"
  add_index "notifications", ["offer_id"], name: "index_notifications_on_offer_id"
  add_index "notifications", ["order_id"], name: "index_notifications_on_order_id"
  add_index "notifications", ["product_id"], name: "index_notifications_on_product_id"
  add_index "notifications", ["seller_id"], name: "index_notifications_on_seller_id"
  add_index "notifications", ["stock_id"], name: "index_notifications_on_stock_id"

  create_table "offers", force: :cascade do |t|
    t.integer  "stock_id"
    t.string   "sales_man"
    t.string   "allocated_by"
    t.decimal  "market_price"
    t.string   "selling_price_type"
    t.decimal  "selling_price"
    t.string   "quantity_type"
    t.string   "size_code"
    t.boolean  "is_taxable"
    t.boolean  "enable_negotitation"
    t.boolean  "visit_store"
    t.decimal  "total_quantity_on_offer"
    t.decimal  "min_order_quantity"
    t.datetime "start_at"
    t.datetime "ends_at"
    t.boolean  "accepts_offer_below_selling_price"
    t.datetime "duration_time"
    t.string   "offer_type"
    t.string   "private_offers"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "seller_id"
    t.string   "desc"
    t.string   "note_to_buyer"
    t.string   "status"
  end

  add_index "offers", ["seller_id"], name: "index_offers_on_seller_id"
  add_index "offers", ["stock_id"], name: "index_offers_on_stock_id"

  create_table "ordered_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "customer_id"
    t.integer  "seller_id"
    t.integer  "offer_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "quantity"
    t.integer  "value"
    t.string   "o_status"
    t.string   "consignment_number"
    t.string   "transport_contact_name"
    t.string   "transport_contact_number"
    t.string   "note_to_buyer"
    t.integer  "paid_amount"
    t.datetime "payment_done_date"
    t.string   "payment_confirmed_by"
  end

  add_index "ordered_items", ["customer_id"], name: "index_ordered_items_on_customer_id"
  add_index "ordered_items", ["offer_id"], name: "index_ordered_items_on_offer_id"
  add_index "ordered_items", ["order_id"], name: "index_ordered_items_on_order_id"
  add_index "ordered_items", ["seller_id"], name: "index_ordered_items_on_seller_id"

  create_table "orders", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "seller_id"
    t.string   "items"
    t.datetime "order_approved_date"
    t.text     "shipping_address"
    t.string   "o_status"
    t.decimal  "total_due"
    t.string   "invoice_number"
    t.datetime "item_shipped_date"
    t.string   "consignment_number"
    t.string   "transport_contact_name"
    t.string   "transport_contact_number"
    t.datetime "item_received_date"
    t.string   "item_recevied_by_name"
    t.string   "item_received_by_number"
    t.datetime "payment_done_date"
    t.string   "payment_confirmed_by"
    t.string   "note_to_buyer"
    t.string   "note_to_seller"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "quantity"
    t.integer  "paid_amount"
    t.string   "payment_type"
    t.string   "shipping_type"
    t.string   "drop_off_point"
    t.string   "pick_up_point"
    t.string   "different_drop_location"
    t.string   "different_shipping_location"
    t.string   "packing_done"
    t.string   "packing_done_by"
    t.string   "otype"
    t.datetime "dropoffdateandtime"
    t.datetime "pickupdateandtime"
    t.datetime "closed_date"
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id"
  add_index "orders", ["seller_id"], name: "index_orders_on_seller_id"

  create_table "packings", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "order_id"
    t.string   "status"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "note_to_packer"
    t.string   "idlestatus"
    t.string   "pallet_type"
    t.integer  "chep_issued"
    t.integer  "chep_due"
    t.string   "priority"
    t.datetime "pickupdate"
    t.datetime "dropoffdate"
    t.string   "note_to_forklift"
    t.string   "assign_to"
    t.string   "pick_up_point"
    t.string   "drop_off_point"
  end

  add_index "packings", ["employee_id"], name: "index_packings_on_employee_id"
  add_index "packings", ["order_id"], name: "index_packings_on_order_id"

  create_table "privateoffers", force: :cascade do |t|
    t.integer  "offer_id"
    t.integer  "customer_id"
    t.integer  "seller_id"
    t.decimal  "offered_price"
    t.string   "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "quantity"
    t.integer  "stock_id"
  end

  add_index "privateoffers", ["customer_id"], name: "index_privateoffers_on_customer_id"
  add_index "privateoffers", ["offer_id"], name: "index_privateoffers_on_offer_id"
  add_index "privateoffers", ["seller_id"], name: "index_privateoffers_on_seller_id"

  create_table "product_requests", force: :cascade do |t|
    t.integer  "seller_id"
    t.integer  "product_id"
    t.string   "required_quantity"
    t.datetime "required_date"
    t.string   "note"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "customer_id"
    t.integer  "poi_id"
    t.string   "quantity_type"
    t.string   "status"
  end

  add_index "product_requests", ["customer_id"], name: "index_product_requests_on_customer_id"
  add_index "product_requests", ["product_id"], name: "index_product_requests_on_product_id"
  add_index "product_requests", ["seller_id"], name: "index_product_requests_on_seller_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.string   "image"
    t.string   "sku"
    t.string   "category"
    t.string   "quality"
    t.string   "size"
    t.string   "size_code"
    t.string   "order_by"
    t.string   "order_quantity_unit"
    t.decimal  "net_weight"
    t.decimal  "packs_per_pellets"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "seller_id"
    t.string   "desc"
    t.string   "variety"
  end

  add_index "products", ["seller_id"], name: "index_products_on_seller_id"

  create_table "purchases", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sellers", force: :cascade do |t|
    t.string   "business_name"
    t.string   "seller_type"
    t.string   "code"
    t.string   "status"
    t.string   "account_type"
    t.string   "business_legal_name"
    t.string   "owner"
    t.string   "market_location"
    t.string   "owner_title"
    t.string   "mobile"
    t.string   "seller_email"
    t.string   "office_phone"
    t.string   "owner_mobile_no"
    t.string   "owner_email"
    t.string   "alternative_contact_name"
    t.string   "alternative_title"
    t.string   "alternative_mobile_number"
    t.string   "fax"
    t.string   "web"
    t.text     "office_address"
    t.text     "shipping_address"
    t.text     "warehouse_address"
    t.text     "billing_address"
    t.string   "logo_for_customer_area"
    t.string   "logo_for_invoices"
    t.string   "approved_by"
    t.boolean  "member_of_smcs"
    t.string   "smcs_no"
    t.string   "abn_no"
    t.string   "tax_file_no"
    t.string   "other"
    t.string   "certificates"
    t.string   "bank_account_type"
    t.string   "bank_name"
    t.string   "bank_address"
    t.string   "account_name"
    t.string   "account_number"
    t.string   "swift_code"
    t.string   "wire_transfer_code"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "authy_id"
    t.datetime "last_sign_in_with_authy"
    t.boolean  "authy_enabled",             default: false
    t.integer  "uid"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "zip"
    t.string   "market_drop_off_location"
    t.decimal  "credit_limit"
    t.integer  "in_network_of"
    t.decimal  "credit_utilized"
    t.decimal  "credit_available"
    t.decimal  "credit_due"
    t.string   "credit_type"
    t.string   "Coop_type"
    t.string   "Coop_ref_no"
    t.string   "credit_terms"
    t.boolean  "coop_credit"
    t.decimal  "coop_credit_limit"
    t.decimal  "coop_credit_utilized"
    t.decimal  "coop_credit_available"
    t.decimal  "coop_credit_due"
    t.integer  "chep_issued"
    t.integer  "chep_due"
    t.integer  "chep_received"
    t.string   "in_chep_network_of"
  end

  add_index "sellers", ["authy_id"], name: "index_sellers_on_authy_id"

  create_table "services", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "slabs", force: :cascade do |t|
    t.integer  "offer_id"
    t.integer  "from_quantity"
    t.integer  "to_quantity"
    t.decimal  "value"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "slabs", ["offer_id"], name: "index_slabs_on_offer_id"

  create_table "stocks", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "grower_id"
    t.string   "status"
    t.decimal  "buying_price"
    t.string   "buying_price_type"
    t.decimal  "in_stock_quantity"
    t.decimal  "physical_stock_quantity"
    t.decimal  "variations"
    t.decimal  "wasted_stock_quantity"
    t.string   "stock_updated_by"
    t.datetime "stock_updated_time"
    t.string   "stock_approved_by"
    t.datetime "stock_approved_time"
    t.string   "physical_stock_taken_by"
    t.datetime "pstb_time"
    t.string   "stock_wasted_by"
    t.datetime "stock_wasted_time"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "seller_id"
    t.string   "product_name"
    t.string   "desc"
    t.string   "order_by"
    t.string   "order_quantity_unit"
    t.string   "net_weight"
    t.string   "packs_per_pellets"
    t.decimal  "stockvalue"
    t.string   "consignment_image"
    t.string   "consignment_number"
    t.datetime "date_received"
    t.string   "ref_no"
    t.string   "sku"
    t.string   "grower_payment_status"
    t.decimal  "paid_value"
    t.integer  "total_approved_stocks",    default: 0
    t.decimal  "purchased_stock_quantity"
    t.integer  "onhold",                   default: 0
    t.integer  "sold",                     default: 0
    t.integer  "offered",                  default: 0
    t.integer  "supply_id"
    t.decimal  "approved_stock_value"
    t.decimal  "osqval"
    t.decimal  "soldval"
    t.decimal  "isqval"
    t.integer  "not_approved",             default: 0
    t.integer  "approve_on_hold_stocks"
    t.string   "note"
  end

  add_index "stocks", ["grower_id"], name: "index_stocks_on_grower_id"
  add_index "stocks", ["product_id"], name: "index_stocks_on_product_id"
  add_index "stocks", ["seller_id"], name: "index_stocks_on_seller_id"
  add_index "stocks", ["supply_id"], name: "index_stocks_on_supply_id"

  create_table "supplies", force: :cascade do |t|
    t.integer  "grower_id"
    t.string   "consignment_number"
    t.datetime "date_received"
    t.string   "ref_no"
    t.decimal  "value"
    t.decimal  "paid"
    t.decimal  "due"
    t.string   "status"
    t.string   "image"
    t.integer  "employee_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "seller_id"
  end

  add_index "supplies", ["employee_id"], name: "index_supplies_on_employee_id"
  add_index "supplies", ["grower_id"], name: "index_supplies_on_grower_id"
  add_index "supplies", ["seller_id"], name: "index_supplies_on_seller_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                   default: "",    null: false
    t.string   "encrypted_password",      default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "utype"
    t.string   "authy_id"
    t.datetime "last_sign_in_with_authy"
    t.boolean  "authy_enabled",           default: false
  end

  add_index "users", ["authy_id"], name: "index_users_on_authy_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "works", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
