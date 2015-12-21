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

ActiveRecord::Schema.define(version: 20151203230955) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "plperl"
  enable_extension "plperlu"
  enable_extension "hstore"

  create_table "actionstatus", force: true do |t|
    t.text    "name"
    t.integer "replication_val", limit: 8
  end

  add_index "actionstatus", ["replication_val"], name: "actionstatus_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "additives", force: true do |t|
    t.text    "name"
    t.integer "additivetype",    limit: 2
    t.integer "location",        limit: 8, default: 1
    t.integer "deleted",         limit: 2, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "additives", ["replication_val"], name: "additives_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "allergens", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "appts", primary_key: "apptid", force: true do |t|
    t.text    "customerid"
    t.text    "thedate"
    t.text    "thetime"
    t.text    "dayofweek"
    t.integer "status",          limit: 2
    t.text    "etc"
    t.integer "tabid",           limit: 8
    t.text    "earlyby"
    t.text    "createdby"
    t.integer "createdtime",     limit: 8
    t.text    "lastedit"
    t.integer "lasttime",        limit: 8
    t.text    "rcnotice"
    t.integer "location",        limit: 8, default: 1
    t.integer "deleted",         limit: 2, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "appts", ["replication_val"], name: "appts_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "auditoptions", force: true do |t|
    t.integer "inventory",       limit: 2, default: 0
    t.integer "cashclose",       limit: 2, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "auditoptions", ["replication_val"], name: "auditoptions_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "backuplog", force: true do |t|
    t.integer "datetime",        limit: 8
    t.integer "mysize",          limit: 8
    t.integer "success"
    t.integer "copytwo",         limit: 2
    t.text    "spacetext"
    t.integer "replication_val", limit: 8
  end

  add_index "backuplog", ["replication_val"], name: "backuplog_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "backupsettings", force: true do |t|
    t.text    "drive"
    t.integer "usecrypt",        limit: 2, default: 0
    t.text    "passphrase"
    t.integer "timeframe",       limit: 2, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "backupsettings", ["replication_val"], name: "backupsettings_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "baddebts", force: true do |t|
    t.integer "deleted",         limit: 2, default: 0
    t.integer "location",        limit: 2, default: 1
    t.decimal "amount"
    t.integer "ticketid",        limit: 8
    t.integer "tickettype",      limit: 2, default: 0
    t.integer "sessiontime",     limit: 8
    t.text    "vendorid"
    t.integer "potype",          limit: 2, default: 0
    t.integer "vendortype",      limit: 2, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "baddebts", ["replication_val"], name: "baddebts_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "barcodecustomization", force: true do |t|
    t.integer "padding",            limit: 2
    t.integer "border",             limit: 2
    t.decimal "pixels"
    t.integer "scale",              limit: 2
    t.integer "xoffset",            limit: 2
    t.integer "yoffset",            limit: 2
    t.integer "includename",        limit: 2
    t.integer "namexoffset",        limit: 2
    t.integer "nameyoffset",        limit: 2
    t.integer "namefontsize",       limit: 2
    t.integer "includedate",        limit: 2
    t.integer "datexoffset",        limit: 2
    t.integer "dateyoffset",        limit: 2
    t.integer "cardxoffset",        limit: 2, default: 0
    t.integer "cardyoffset",        limit: 2, default: 0
    t.integer "includecard",        limit: 2, default: 0
    t.integer "includedestination", limit: 2, default: 0
    t.integer "destinationxoffset", limit: 2, default: 0
    t.integer "destinationyoffset", limit: 2, default: 0
    t.integer "textwrap",           limit: 2
    t.integer "pquantity",          limit: 2, default: 0
    t.integer "replication_val",    limit: 8
  end

  add_index "barcodecustomization", ["replication_val"], name: "barcodecustomization_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "barcodemessages", force: true do |t|
    t.text    "messagetype"
    t.text    "message"
    t.integer "replication_val", limit: 8
  end

  add_index "barcodemessages", ["replication_val"], name: "barcodemessages_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "barcodescanner", id: false, force: true do |t|
    t.integer "sendsreturn", limit: 2, default: 1
  end

  create_table "bio_manifest_stop_data", force: true do |t|
    t.text    "manifestid"
    t.integer "sessiontime",            limit: 8
    t.integer "stopnumber"
    t.integer "location",               limit: 8, default: 1
    t.text    "travel_route"
    t.text    "name"
    t.text    "license_number"
    t.text    "street"
    t.text    "city"
    t.text    "state"
    t.text    "zip"
    t.text    "phone"
    t.text    "depart_time"
    t.text    "arrive_time"
    t.integer "item_count"
    t.integer "transactionid",          limit: 8
    t.integer "transactionid_original", limit: 8
    t.integer "replication_val",        limit: 8
    t.integer "deleted",                limit: 2, default: 0
    t.integer "stopnumber_original"
    t.integer "item_count_original"
  end

  add_index "bio_manifest_stop_data", ["replication_val"], name: "bio_manifest_stop_data_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "bio_manifest_stop_items", force: true do |t|
    t.text    "manifestid"
    t.integer "sessiontime",            limit: 8
    t.integer "stopnumber"
    t.integer "location",               limit: 8, default: 1
    t.text    "inventoryid"
    t.decimal "quantity"
    t.text    "description"
    t.integer "requiresweighing",       limit: 2, default: 0
    t.integer "transactionid",          limit: 8
    t.integer "transactionid_original", limit: 8
    t.integer "replication_val",        limit: 8
    t.integer "deleted",                limit: 2, default: 0
  end

  add_index "bio_manifest_stop_items", ["replication_val"], name: "bio_manifest_stop_items_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "bio_manifests", force: true do |t|
    t.text    "manifestid"
    t.integer "sessiontime",                        limit: 8
    t.integer "stopcount"
    t.integer "location",                           limit: 8, default: 1
    t.text    "transporter_dob"
    t.text    "transporter_name"
    t.text    "transporter_id"
    t.text    "transporter_vehicle_details"
    t.text    "transporter_vehicle_identification"
    t.text    "completion_date"
    t.text    "origination_license_number"
    t.text    "origination_name"
    t.text    "origination_street"
    t.text    "origination_city"
    t.text    "origination_state"
    t.text    "origination_zip"
    t.text    "origination_phone"
    t.integer "total_item_count"
    t.integer "transactionid",                      limit: 8
    t.integer "deleted",                            limit: 2, default: 0
    t.integer "fulfilled",                          limit: 2, default: 0
    t.text    "myvendor"
    t.integer "transactionid_original",             limit: 8
    t.integer "replication_val",                    limit: 8
    t.integer "manifest_type",                      limit: 2, default: 0
    t.integer "manifest_fully_completed",           limit: 2, default: 1
    t.integer "first_stop_time",                    limit: 8
    t.integer "stopcount_original"
    t.integer "total_item_count_original"
  end

  add_index "bio_manifests", ["replication_val"], name: "bio_manifests_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "bio_manifests_route_cache", force: true do |t|
    t.text    "origin_license"
    t.text    "destination_license"
    t.text    "route"
    t.integer "travel_time",         limit: 8
    t.integer "replication_val",     limit: 8
  end

  add_index "bio_manifests_route_cache", ["replication_val"], name: "bio_manifests_route_cache_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "bioemployees", force: true do |t|
    t.text    "name"
    t.text    "licensenum"
    t.text    "birthday"
    t.text    "birthmonth"
    t.text    "birthyear"
    t.integer "deleted",                limit: 2, default: 0
    t.text    "hireday"
    t.text    "hiremonth"
    t.text    "hireyear"
    t.integer "transactionid",          limit: 8
    t.integer "transactionid_original", limit: 8
    t.integer "replication_val",        limit: 8
  end

  add_index "bioemployees", ["replication_val"], name: "bioemployees_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "bioemployees_vendors", force: true do |t|
    t.text    "name"
    t.text    "licensenum"
    t.text    "birthday"
    t.text    "birthmonth"
    t.text    "birthyear"
    t.integer "deleted",                limit: 2, default: 0
    t.text    "hireday"
    t.text    "hiremonth"
    t.text    "hireyear"
    t.integer "transactionid",          limit: 8
    t.integer "transactionid_original", limit: 8
    t.text    "vendor_ubi"
    t.text    "vendor_license"
    t.integer "vendor_type",            limit: 2
    t.integer "replication_val",        limit: 8
  end

  add_index "bioemployees_vendors", ["replication_val"], name: "bioemployees_vendors_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "bmsi_lab_cannabinoids", id: false, force: true do |t|
    t.integer "id",   limit: 8, default: "nextval('bmsi_lab_cannabinoids_id_seq'::regclass)", null: false
    t.text    "name"
  end

  create_table "bmsi_lab_foreign_matter_types", id: false, force: true do |t|
    t.integer "id",              limit: 8, default: "nextval('bmsi_lab_foreign_matter_types_id_seq'::regclass)", null: false
    t.text    "name"
    t.decimal "pass_fail_limit"
    t.integer "inventorytype",   limit: 2
  end

  create_table "bmsi_lab_micro_screening", id: false, force: true do |t|
    t.integer "id",              limit: 8, default: "nextval('bmsi_lab_micro_screening_id_seq'::regclass)", null: false
    t.integer "inventorytype",   limit: 2
    t.text    "name"
    t.decimal "pass_fail_limit"
    t.text    "name_long"
  end

  create_table "bmsi_lab_moisture_content", id: false, force: true do |t|
    t.integer "id",              limit: 8, default: "nextval('bmsi_lab_moisture_content_id_seq'::regclass)", null: false
    t.integer "inventorytype",   limit: 2
    t.decimal "pass_fail_limit"
  end

  create_table "bmsi_lab_potency_analysis", id: false, force: true do |t|
    t.integer "id",              limit: 8, default: "nextval('bmsi_lab_potency_analysis_id_seq'::regclass)", null: false
    t.integer "inventorytype",   limit: 2
    t.integer "cannabinoid",     limit: 2
    t.decimal "pass_fail_limit"
    t.integer "units",           limit: 2
  end

  create_table "bmsi_lab_required_tests", id: false, force: true do |t|
    t.integer "id",                limit: 8, default: "nextval('bmsi_lab_required_tests_id_seq'::regclass)", null: false
    t.integer "inventorytype",     limit: 2
    t.integer "inventorytype_end", limit: 2
    t.integer "test_type",         limit: 8
    t.integer "conditional",       limit: 2, default: 0
  end

  create_table "bmsi_lab_solvent_screening", id: false, force: true do |t|
    t.integer "id",              limit: 8, default: "nextval('bmsi_lab_solvent_screening_id_seq'::regclass)", null: false
    t.integer "inventorytype",   limit: 2
    t.decimal "pass_fail_limit"
  end

  create_table "bmsi_lab_test_types", id: false, force: true do |t|
    t.integer "id",               limit: 8, default: "nextval('bmsi_lab_test_types_id_seq'::regclass)", null: false
    t.integer "test_type",        limit: 2
    t.text    "test_name"
    t.integer "conditional_fail", limit: 2, default: 0
  end

  create_table "bmsi_lab_valid_types", id: false, force: true do |t|
    t.integer "id",            limit: 8, default: "nextval('bmsi_lab_valid_types_id_seq'::regclass)", null: false
    t.integer "inventorytype", limit: 2
  end

  create_table "bmsi_labresults_foreign_matter", id: false, force: true do |t|
    t.integer "id",              limit: 8, default: "nextval('bmsi_labresults_foreign_matter_id_seq'::regclass)", null: false
    t.integer "sample_id",       limit: 8
    t.text    "name"
    t.decimal "value"
    t.integer "failure",         limit: 2, default: 0
    t.integer "location",        limit: 8
    t.integer "replication_val", limit: 8
  end

  add_index "bmsi_labresults_foreign_matter", ["replication_val"], name: "bmsi_labresults_foreign_matter_replication_idx", where: "(replication_val > 0)", using: :btree
  add_index "bmsi_labresults_foreign_matter", ["sample_id"], name: "bmsi_labresults_foreign_matter_sample_idx", using: :btree

  create_table "bmsi_labresults_micro_screening", id: false, force: true do |t|
    t.integer "id",              limit: 8, default: "nextval('bmsi_labresults_micro_screening_id_seq'::regclass)", null: false
    t.integer "sample_id",       limit: 8
    t.text    "name"
    t.decimal "value"
    t.integer "failure",         limit: 2, default: 0
    t.integer "location",        limit: 8
    t.integer "replication_val", limit: 8
  end

  add_index "bmsi_labresults_micro_screening", ["replication_val"], name: "bmsi_labresults_micro_screening_replication_idx", where: "(replication_val > 0)", using: :btree
  add_index "bmsi_labresults_micro_screening", ["sample_id"], name: "bmsi_labresults_micro_screening_sample_idx", using: :btree

  create_table "bmsi_labresults_moisture_content", id: false, force: true do |t|
    t.integer "id",              limit: 8, default: "nextval('bmsi_labresults_moisture_content_id_seq'::regclass)", null: false
    t.integer "sample_id",       limit: 8
    t.text    "name"
    t.decimal "value"
    t.integer "failure",         limit: 2, default: 0
    t.integer "location",        limit: 8
    t.integer "replication_val", limit: 8
  end

  add_index "bmsi_labresults_moisture_content", ["replication_val"], name: "bmsi_labresults_moisture_content_replication_idx", where: "(replication_val > 0)", using: :btree
  add_index "bmsi_labresults_moisture_content", ["sample_id"], name: "bmsi_labresults_moisture_content_sample_idx", using: :btree

  create_table "bmsi_labresults_potency_analysis", id: false, force: true do |t|
    t.integer "id",              limit: 8, default: "nextval('bmsi_labresults_potency_analysis_id_seq'::regclass)", null: false
    t.integer "sample_id",       limit: 8
    t.text    "name"
    t.decimal "value"
    t.integer "units",           limit: 2
    t.integer "failure",         limit: 2, default: 0
    t.integer "location",        limit: 8
    t.integer "replication_val", limit: 8
  end

  add_index "bmsi_labresults_potency_analysis", ["replication_val"], name: "bmsi_labresults_potency_analysis_replication_idx", where: "(replication_val > 0)", using: :btree
  add_index "bmsi_labresults_potency_analysis", ["sample_id"], name: "bmsi_labresults_potency_analysis_sample_idx", using: :btree

  create_table "bmsi_labresults_samples", force: true do |t|
    t.text    "inventoryid"
    t.decimal "quantity"
    t.integer "sessiontime",            limit: 8
    t.integer "inventorytype",          limit: 8
    t.text    "strain"
    t.text    "product_name"
    t.integer "deleted",                limit: 2, default: 0
    t.integer "result",                 limit: 2, default: 0
    t.text    "lab_license"
    t.integer "sample_use",             limit: 2
    t.integer "location",               limit: 8
    t.integer "transactionid",          limit: 8
    t.integer "labid",                  limit: 8
    t.text    "manifestid"
    t.integer "transferid",             limit: 8
    t.text    "parentid"
    t.integer "transactionid_original", limit: 8
    t.integer "replication_val",        limit: 8
    t.text    "other_sample_id"
    t.text    "inventoryparentid"
  end

  add_index "bmsi_labresults_samples", ["inventoryid"], name: "bmsi_labresults_samples_inv_idx", using: :btree
  add_index "bmsi_labresults_samples", ["parentid"], name: "bmsi_labresults_samples_inv_parent_idx", using: :btree
  add_index "bmsi_labresults_samples", ["replication_val"], name: "bmsi_labresults_samples_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "bmsi_labresults_solvent_screening", id: false, force: true do |t|
    t.integer "id",              limit: 8, default: "nextval('bmsi_labresults_solvent_screening_id_seq'::regclass)", null: false
    t.integer "sample_id",       limit: 8
    t.text    "name"
    t.decimal "value"
    t.integer "failure",         limit: 2, default: 0
    t.integer "location",        limit: 8
    t.integer "replication_val", limit: 8
  end

  add_index "bmsi_labresults_solvent_screening", ["replication_val"], name: "bmsi_labresults_solvent_screening_replication_idx", where: "(replication_val > 0)", using: :btree
  add_index "bmsi_labresults_solvent_screening", ["sample_id"], name: "bmsi_labresults_solvent_screening_sample_idx", using: :btree

  create_table "budtenderscreen", force: true do |t|
    t.integer "enabled",                limit: 2, default: 0
    t.integer "printlabelweighable",    limit: 2, default: 1
    t.integer "printlabelnonweighable", limit: 2, default: 1
    t.integer "printlabelnonmedicated", limit: 2, default: 1
    t.integer "autoadd",                limit: 2, default: 0
    t.integer "replication_val",        limit: 8
  end

  add_index "budtenderscreen", ["replication_val"], name: "budtenderscreen_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "campaigncurrent", force: true do |t|
    t.integer "completed",         limit: 2,  default: 0
    t.string  "customerid",        limit: 10
    t.integer "campaignhistoryid", limit: 8
    t.text    "emailoverride"
    t.integer "replication_val",   limit: 8
  end

  add_index "campaigncurrent", ["replication_val"], name: "campaigncurrent_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "campaignhistory", force: true do |t|
    t.integer "completed",        limit: 2, default: 0
    t.integer "campaignid",       limit: 8
    t.integer "starttime",        limit: 8
    t.integer "endtime",          limit: 8
    t.integer "emailorsms",       limit: 2, default: 0
    t.integer "istest",           limit: 2, default: 0
    t.integer "recipientcount",   limit: 8, default: 0
    t.integer "recipientsuccess", limit: 8, default: 0
    t.integer "recipientfailure", limit: 8, default: 0
    t.integer "replication_val",  limit: 8
  end

  add_index "campaignhistory", ["replication_val"], name: "campaignhistory_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "campaigns", force: true do |t|
    t.integer "sendtype",           limit: 2, default: 0
    t.text    "subject"
    t.text    "fromaddress"
    t.text    "htmlversion"
    t.text    "textversion"
    t.integer "emailorsms",         limit: 2, default: 0
    t.text    "name"
    t.text    "recipientselection"
    t.integer "deleted",            limit: 2, default: 0
    t.integer "replication_val",    limit: 8
  end

  add_index "campaigns", ["replication_val"], name: "campaigns_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "cashclose", force: true do |t|
    t.decimal "amount"
    t.decimal "countedamount"
    t.integer "timestart",             limit: 8
    t.integer "timeend",               limit: 8
    t.text    "userid"
    t.integer "terminalid",            limit: 8
    t.integer "ticketserial",          limit: 8
    t.decimal "opening"
    t.decimal "difference"
    t.text    "actualcount"
    t.integer "location",              limit: 8, default: 1
    t.decimal "deposit"
    t.integer "wholesaleticketserial", limit: 8
    t.integer "payoutserial",          limit: 8
    t.text    "notes"
    t.integer "replication_val",       limit: 8
  end

  add_index "cashclose", ["replication_val"], name: "cashclose_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "cashcloseoptions", force: true do |t|
    t.integer "includewholesale", limit: 2, default: 1
    t.integer "location",         limit: 8
    t.integer "byterminal",       limit: 2, default: 1
    t.integer "autodeposit",      limit: 2, default: 0
    t.integer "terminalselect",   limit: 2, default: 0
    t.integer "replication_val",  limit: 8
  end

  add_index "cashcloseoptions", ["replication_val"], name: "cashcloseoptions_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "checkin", force: true do |t|
    t.integer "location",        limit: 8,  default: 1
    t.string  "customerid",      limit: 10
    t.text    "data"
    t.integer "checkintime",     limit: 8
    t.integer "checkouttime",    limit: 8
    t.integer "salecompleted",   limit: 2,  default: 0
    t.integer "completed",       limit: 2,  default: 0
    t.text    "batchdata"
    t.integer "terminalid",      limit: 8
    t.text    "userid"
    t.text    "ticketid"
    t.integer "replication_val", limit: 8
  end

  add_index "checkin", ["replication_val"], name: "checkin_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "colordryphases", force: true do |t|
    t.integer "phasenum",        limit: 2, default: 0
    t.text    "color"
    t.integer "replication_val", limit: 8
  end

  add_index "colordryphases", ["replication_val"], name: "colordryphases_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "colorphases", force: true do |t|
    t.integer "phasenum",        limit: 2, default: 0
    t.text    "color"
    t.integer "replication_val", limit: 8
  end

  add_index "colorphases", ["replication_val"], name: "colorphases_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "complementary_product_reorderpoints", force: true do |t|
    t.text    "name"
    t.integer "location",                limit: 8
    t.decimal "desiredamtavailable"
    t.decimal "desiredreorderpt"
    t.decimal "desiredreorderpt_ignore"
    t.integer "defaultvendor",           limit: 8
    t.integer "productcategory",         limit: 8
    t.integer "requiresweighing",        limit: 2
    t.integer "replication_val",         limit: 8
  end

  add_index "complementary_product_reorderpoints", ["replication_val"], name: "complementary_product_reorderpoints_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "complementary_productcategory_reorderpoints", force: true do |t|
    t.text    "name"
    t.integer "location",                limit: 8
    t.decimal "desiredamtavailable"
    t.decimal "desiredreorderpt"
    t.decimal "desiredreorderpt_ignore"
    t.integer "replication_val",         limit: 8
  end

  add_index "complementary_productcategory_reorderpoints", ["replication_val"], name: "complementary_productcategory_reorderpoints_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "conditions", force: true do |t|
    t.text    "name"
    t.integer "replication_val", limit: 8
  end

  add_index "conditions", ["replication_val"], name: "conditions_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "connectsettings", force: true do |t|
    t.integer "dpersistent",        limit: 2, default: 0
    t.integer "forcedpersistent",   limit: 2, default: 0
    t.integer "async",              limit: 2, default: 0
    t.integer "asynctimeout",       limit: 2, default: 60
    t.integer "standardconnection", limit: 2, default: 1
    t.integer "fastreload",         limit: 2, default: 0
    t.integer "progressbar",        limit: 2, default: 1
    t.integer "replication_val",    limit: 8
    t.integer "auth_server",        limit: 2, default: 0
  end

  add_index "connectsettings", ["replication_val"], name: "connectsettings_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "containers", force: true do |t|
    t.integer "category",        limit: 2
    t.decimal "weight",                    default: 0.0
    t.text    "name"
    t.text    "image"
    t.integer "location",        limit: 8, default: 1
    t.integer "deleted",         limit: 2, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "containers", ["replication_val"], name: "containers_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "crc", force: true do |t|
    t.text    "filename"
    t.text    "crc"
    t.integer "isnew",           limit: 2, default: 0
    t.integer "execute",         limit: 2, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "crc", ["replication_val"], name: "crc_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "cumulativepricepoint", force: true do |t|
    t.integer "enabled",         limit: 2, default: 0
    t.integer "selective",       limit: 2, default: 0
    t.integer "cascading",       limit: 2, default: 0
    t.integer "advanced",        limit: 2, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "cumulativepricepoint", ["replication_val"], name: "cumulativepricepoint_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "custodychain", primary_key: "custodyid", force: true do |t|
    t.string  "id",                     limit: 16
    t.text    "orgname"
    t.text    "userid"
    t.integer "transactionid",          limit: 8
    t.integer "sessiontime",            limit: 8
    t.decimal "lastweight",                        default: 0.0
    t.decimal "lastcontainerweight",               default: 0.0
    t.integer "location",               limit: 8,  default: 1
    t.integer "idtype",                 limit: 2,  default: 1
    t.integer "transactionid_original", limit: 8
  end

  create_table "customerconditions", force: true do |t|
    t.text    "customerid"
    t.integer "conditionid",     limit: 8
    t.integer "deleted",         limit: 2, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "customerconditions", ["replication_val"], name: "customerconditions_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "customernotes", force: true do |t|
    t.string  "customerid",      limit: 10
    t.text    "userid"
    t.integer "sessiontime",     limit: 8
    t.text    "note"
    t.integer "priority",        limit: 2,  default: 0
    t.integer "deleted",         limit: 2,  default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "customernotes", ["replication_val"], name: "customernotes_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "customers", primary_key: "customerid", force: true do |t|
    t.text     "lastname"
    t.text     "firstname"
    t.text     "middlename"
    t.string   "birthmonth",                   limit: 2
    t.string   "birthday",                     limit: 2
    t.string   "birthyear",                    limit: 4
    t.text     "phone"
    t.integer  "fpassociated",                 limit: 2
    t.string   "stubid",                       limit: 10
    t.text     "address1"
    t.text     "address2"
    t.text     "city"
    t.text     "state"
    t.text     "zip"
    t.integer  "ismember",                     limit: 2,  default: 0
    t.text     "email"
    t.text     "cell"
    t.integer  "carrierchoice"
    t.text     "redcard"
    t.string   "redcardmonth",                 limit: 2
    t.string   "redcardday",                   limit: 2
    t.string   "redcardyear",                  limit: 4
    t.integer  "redcardtime",                  limit: 8
    t.integer  "emailoptin",                   limit: 2,  default: 1
    t.integer  "smsoptin",                     limit: 2,  default: 1
    t.text     "licensenum"
    t.text     "licensetext"
    t.string   "licenseexpmonth",              limit: 2
    t.string   "licenseexpyear",               limit: 4
    t.integer  "location",                     limit: 8,  default: 1
    t.text     "generic0"
    t.text     "generic1"
    t.text     "generic2"
    t.text     "generic3"
    t.text     "generic4"
    t.text     "generic5"
    t.text     "generic6"
    t.text     "generic7"
    t.text     "generic8"
    t.text     "generic9"
    t.integer  "createdate",                   limit: 8
    t.text     "mmapaid"
    t.text     "mmapauid"
    t.integer  "visits",                       limit: 8,  default: 0
    t.decimal  "mmapadiscount",                           default: 0.0
    t.decimal  "amountspent",                             default: 0.0
    t.integer  "deleted",                      limit: 2,  default: 0
    t.text     "referral"
    t.integer  "plantcount",                              default: 0
    t.decimal  "discount"
    t.integer  "taxrate"
    t.integer  "membersince",                  limit: 8
    t.text     "userid"
    t.integer  "sessiontime",                  limit: 8
    t.text     "qblistid"
    t.text     "qbresponse"
    t.datetime "created",                                 default: "now()"
    t.datetime "modified"
    t.text     "prebatch"
    t.decimal  "limoverride"
    t.integer  "limtype",                      limit: 2
    t.decimal  "limitoverridereal"
    t.decimal  "lastspent"
    t.text     "mmar"
    t.text     "caregiver"
    t.integer  "providerid",                   limit: 8
    t.decimal  "points"
    t.decimal  "customerbalance"
    t.integer  "vendorid",                     limit: 8
    t.integer  "iscaregiver",                  limit: 2
    t.text     "rcustomerid"
    t.text     "kushid"
    t.text     "kushidverified"
    t.text     "kushidemail"
    t.integer  "sex",                          limit: 2
    t.integer  "replication_val",              limit: 8
    t.integer  "limitdate",                    limit: 8
    t.integer  "accting_invoices_customer_id",            default: "nextval('customers_accting_invoices_customer_id_seq'::regclass)", null: false
  end

  add_index "customers", ["replication_val"], name: "customers_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "customersettings", force: true do |t|
    t.integer "dupeprotection",   limit: 2, default: 0
    t.integer "dupelfactor",      limit: 2, default: 0
    t.integer "dupeffactor",      limit: 2, default: 0
    t.integer "renameprotection", limit: 2, default: 0
    t.integer "renamelfactor",    limit: 2, default: 0
    t.integer "renameffactor",    limit: 2, default: 0
    t.integer "scancustomer",     limit: 2, default: 0
    t.integer "replication_val",  limit: 8
  end

  add_index "customersettings", ["replication_val"], name: "customersettings_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "customerslog", primary_key: "logid", force: true do |t|
    t.string  "customerid",        limit: 10
    t.text    "lastname"
    t.text    "firstname"
    t.text    "middlename"
    t.string  "birthmonth",        limit: 2
    t.string  "birthday",          limit: 2
    t.string  "birthyear",         limit: 4
    t.text    "phone"
    t.integer "fpassociated",      limit: 2
    t.string  "stubid",            limit: 10
    t.text    "address1"
    t.text    "address2"
    t.text    "city"
    t.text    "state"
    t.text    "zip"
    t.integer "ismember",          limit: 2,  default: 0
    t.text    "email"
    t.text    "cell"
    t.integer "carrierchoice"
    t.text    "redcard"
    t.string  "redcardmonth",      limit: 2
    t.string  "redcardday",        limit: 2
    t.string  "redcardyear",       limit: 4
    t.integer "redcardtime",       limit: 8
    t.integer "emailoptin",        limit: 2,  default: 1
    t.integer "smsoptin",          limit: 2,  default: 1
    t.text    "licensenum"
    t.text    "licensetext"
    t.string  "licenseexpmonth",   limit: 2
    t.string  "licenseexpyear",    limit: 4
    t.integer "location",          limit: 8,  default: 1
    t.text    "generic0"
    t.text    "generic1"
    t.text    "generic2"
    t.text    "generic3"
    t.text    "generic4"
    t.text    "generic5"
    t.text    "generic6"
    t.text    "generic7"
    t.text    "generic8"
    t.text    "generic9"
    t.text    "mmapaid"
    t.text    "mmapauid"
    t.integer "visits",            limit: 8,  default: 0
    t.decimal "mmapadiscount",                default: 0.0
    t.decimal "amountspent",                  default: 0.0
    t.integer "deleted",           limit: 2,  default: 0
    t.text    "referral"
    t.integer "plantcount",                   default: 0
    t.decimal "discount"
    t.integer "taxrate"
    t.integer "membersince",       limit: 8
    t.text    "userid"
    t.integer "sessiontime",       limit: 8
    t.decimal "limitoverridereal"
    t.text    "mmar"
    t.text    "caregiver"
    t.integer "providerid",        limit: 8
    t.decimal "points"
    t.decimal "customerbalance"
    t.integer "replication_val",   limit: 8
    t.integer "limitdate",         limit: 8
  end

  add_index "customerslog", ["replication_val"], name: "customerslog_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "customfields", force: true do |t|
    t.text    "name"
    t.integer "type",            limit: 2, default: 0
    t.text    "defaultvalue"
    t.text    "availablevalues"
    t.integer "columnnum",       limit: 2, default: 0
    t.integer "deleted",         limit: 2, default: 0
    t.integer "popup",           limit: 2, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "customfields", ["replication_val"], name: "customfields_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "discountprograms", force: true do |t|
    t.text    "name"
    t.text    "productqualifier"
    t.integer "location",         limit: 2, default: 1
    t.text    "priceoverride"
    t.decimal "discount",                   default: 0.0
    t.integer "ispercentagerate", limit: 2, default: 0
    t.integer "maxproducts",      limit: 2, default: 0
    t.text    "code"
    t.integer "deleted",          limit: 2, default: 0
    t.integer "istaxable",        limit: 2, default: 0
    t.integer "cumulative",       limit: 2, default: 0
    t.integer "isexclusive",      limit: 2, default: 0
    t.text    "externalbarcode"
    t.integer "limitenabled",     limit: 2, default: 0
    t.integer "limit1",           limit: 2
    t.integer "limittype",        limit: 2
    t.integer "ismembersonly",    limit: 2
    t.decimal "maxqty"
    t.integer "taxcat",           limit: 8
    t.integer "replication_val",  limit: 8
  end

  add_index "discountprograms", ["replication_val"], name: "discountprograms_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "discounts", force: true do |t|
    t.string   "ticketid",         limit: 16
    t.integer  "saleid",           limit: 8
    t.text     "discounttext"
    t.text     "discountcode"
    t.integer  "location",         limit: 8,  default: 1
    t.integer  "ispercentagerate", limit: 2,  default: 0
    t.decimal  "rateamount",                  default: 0.0
    t.integer  "isreward",         limit: 2,  default: 0
    t.decimal  "amount"
    t.integer  "deleted",          limit: 2,  default: 0
    t.integer  "istaxable",        limit: 2,  default: 0
    t.integer  "refunded",         limit: 2,  default: 0
    t.string   "refticketid",      limit: 16
    t.text     "userid"
    t.integer  "datetime",         limit: 8
    t.text     "qblistid"
    t.text     "qbresponse"
    t.datetime "created",                     default: "now()"
    t.datetime "modified"
    t.text     "discountreason"
    t.string   "customerid",       limit: 10
    t.integer  "terminalid",       limit: 8
    t.integer  "replication_val",  limit: 8
  end

  add_index "discounts", ["replication_val"], name: "discounts_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "doctors", force: true do |t|
    t.text    "first"
    t.text    "last"
    t.text    "middle"
    t.text    "address1"
    t.text    "address2"
    t.text    "city"
    t.string  "state",           limit: 2
    t.string  "zip",             limit: 10
    t.text    "title"
    t.text    "phone"
    t.text    "fax"
    t.text    "dea"
    t.integer "inactive",        limit: 2,  default: 0
    t.integer "deleted",         limit: 2,  default: 0
    t.text    "licensenum"
    t.text    "website"
    t.integer "replication_val", limit: 8
  end

  add_index "doctors", ["replication_val"], name: "doctors_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "documentcategories", force: true do |t|
    t.text    "name"
    t.integer "deleted",         limit: 2, default: 0
    t.integer "location",        limit: 2, default: 1
    t.integer "replication_val", limit: 8
  end

  add_index "documentcategories", ["replication_val"], name: "documentcategories_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "documents", primary_key: "docid", force: true do |t|
    t.text    "docname"
    t.text    "docdata"
    t.text    "customerid"
    t.integer "datetime",        limit: 8
    t.integer "deleted",         limit: 2, default: 0
    t.integer "doccategory",     limit: 2
    t.integer "rotate",          limit: 2
    t.integer "replication_val", limit: 8
  end

  add_index "documents", ["customerid"], name: "documents_customerid", using: :btree
  add_index "documents", ["deleted"], name: "documents_deleted", using: :btree
  add_index "documents", ["replication_val"], name: "documents_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "dryphases", force: true do |t|
    t.text    "strain"
    t.integer "phase",           limit: 2
    t.text    "phasename"
    t.integer "timelengthlow",   limit: 8
    t.integer "timelengthhigh",  limit: 8
    t.integer "replication_val", limit: 8
  end

  add_index "dryphases", ["replication_val"], name: "dryphases_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "dryphasetext", force: true do |t|
    t.text    "phasename"
    t.integer "myorder",         limit: 2
    t.integer "deleted",         limit: 2, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "dryphasetext", ["replication_val"], name: "dryphasetext_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "externalbarcodes", force: true do |t|
    t.integer "enabled",         limit: 2, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "externalbarcodes", ["replication_val"], name: "externalbarcodes_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "facebooksettings", force: true do |t|
    t.text    "username"
    t.text    "password"
    t.integer "active",          limit: 2, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "facebooksettings", ["replication_val"], name: "facebooksettings_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "ftpsettings", force: true do |t|
    t.text    "username"
    t.text    "password"
    t.text    "hostname"
    t.text    "directory"
    t.integer "replication_val", limit: 8
    t.integer "ssl",             limit: 2, default: 0
    t.integer "port",            limit: 2, default: 21
  end

  add_index "ftpsettings", ["replication_val"], name: "ftpsettings_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "growenvironment", force: true do |t|
    t.integer "sessiontime",     limit: 8
    t.decimal "temperature",               default: 0.0
    t.decimal "dewpoint",                  default: 0.0
    t.decimal "humidity",                  default: 0.0
    t.integer "tempunits",       limit: 2
    t.integer "replication_val", limit: 8
  end

  add_index "growenvironment", ["replication_val"], name: "growenvironment_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "growgridsettings", force: true do |t|
    t.integer "growx",           limit: 2
    t.integer "growy",           limit: 2
    t.integer "location",        limit: 8, default: 1
    t.integer "autoage",         limit: 2, default: 1
    t.integer "bystrain",        limit: 2, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "growgridsettings", ["replication_val"], name: "growgridsettings_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "growhouseundo", force: true do |t|
    t.text    "action"
    t.integer "sessiontime",     limit: 8
    t.text    "plantid"
    t.text    "modifyuser"
    t.integer "replication_val", limit: 8
  end

  add_index "growhouseundo", ["replication_val"], name: "growhouseundo_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "growtaborder", force: true do |t|
    t.text    "tabname"
    t.integer "taborder",        limit: 2
    t.integer "replication_val", limit: 8
  end

  add_index "growtaborder", ["replication_val"], name: "growtaborder_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "hosts", primary_key: "hostname", force: true do |t|
    t.integer "lastused",        limit: 2
    t.integer "replication_val", limit: 8
  end

  add_index "hosts", ["replication_val"], name: "hosts_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "imessages", force: true do |t|
    t.text    "sender"
    t.text    "receiver"
    t.integer "sendtime",        limit: 8
    t.text    "messagebody"
    t.integer "terminal",        limit: 8
    t.integer "sendterminal",    limit: 8
    t.integer "replication_val", limit: 8
  end

  add_index "imessages", ["receiver"], name: "imessages_owner_index", using: :btree
  add_index "imessages", ["replication_val"], name: "imessages_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "inventory", force: true do |t|
    t.text     "strain"
    t.text     "straintype"
    t.decimal  "weight",                                      default: 0.0
    t.integer  "dispensed",                         limit: 2, default: 0
    t.decimal  "dispensedsofar",                              default: 0.0
    t.integer  "transactionid",                     limit: 8
    t.integer  "transferredout",                    limit: 2, default: 0
    t.integer  "transferredouttime",                limit: 8
    t.integer  "dispensedtime",                     limit: 8
    t.text     "plantid"
    t.decimal  "adjustedsofar",                               default: 0.0
    t.integer  "location",                          limit: 8, default: 1,       null: false
    t.integer  "sessiontime",                       limit: 8
    t.integer  "byproduct",                         limit: 2, default: 0
    t.decimal  "remainingweight",                             default: 0.0
    t.integer  "transferredin",                     limit: 2, default: 0
    t.integer  "transferredintime",                 limit: 8
    t.integer  "transferredfrom",                   limit: 8
    t.integer  "transferredto",                     limit: 8
    t.integer  "productid",                         limit: 8
    t.text     "parentid"
    t.integer  "ismedicated",                       limit: 2, default: 1
    t.integer  "requiresweighing",                  limit: 2, default: 1
    t.decimal  "quantity"
    t.decimal  "pricein",                                     default: 0.0
    t.integer  "vendorid",                          limit: 8
    t.decimal  "priceout",                                    default: 0.0
    t.decimal  "containerweight",                             default: 0.0
    t.integer  "deleted",                           limit: 2, default: 0
    t.decimal  "combinedweight"
    t.integer  "inventorytype",                     limit: 2, default: -1
    t.integer  "plantcount",                        limit: 2, default: 0
    t.text     "roomdata"
    t.integer  "lastaction",                        limit: 2
    t.text     "lastuser"
    t.text     "plantdata"
    t.integer  "plantdatatype",                     limit: 2
    t.text     "plantlocation"
    t.text     "plantadditives"
    t.integer  "wet",                               limit: 2
    t.integer  "grade",                             limit: 8
    t.text     "batchno"
    t.integer  "lastroom",                          limit: 8
    t.text     "inventoryparentid"
    t.text     "secondaryid"
    t.text     "packageweight"
    t.integer  "inventorystatus",                   limit: 2
    t.integer  "inventorystatustime",               limit: 8
    t.integer  "currentroom",                       limit: 8, default: 0
    t.integer  "tested",                            limit: 2, default: 0
    t.integer  "test_sent",                         limit: 2, default: 0
    t.text     "sample_id"
    t.integer  "test_result",                       limit: 2
    t.integer  "expiration",                        limit: 8
    t.integer  "local_created",                     limit: 2
    t.integer  "packagedate",                       limit: 8
    t.integer  "seized",                            limit: 2
    t.text     "source_id"
    t.integer  "transactionid_original",            limit: 8
    t.integer  "replication_val",                   limit: 8
    t.decimal  "inventory_valuation_cogs_expensed",           default: 0.0,     null: false
    t.decimal  "cost_per_unit"
    t.datetime "created",                                     default: "now()"
    t.integer  "is_sample",                         limit: 2
  end

  add_index "inventory", ["replication_val"], name: "inventory_replication_idx", where: "(replication_val > 0)", using: :btree
  add_index "inventory", ["strain"], name: "inventory_strain", using: :btree

  create_table "inventory_nonregulated", force: true do |t|
    t.decimal "weight",                       default: 0.0
    t.integer "transactionid",      limit: 8
    t.integer "transferredout",     limit: 2, default: 0
    t.integer "transferredouttime", limit: 8
    t.integer "dispensedtime",      limit: 8
    t.text    "description"
    t.decimal "adjustedsofar",                default: 0.0
    t.integer "location",           limit: 8, default: 1,                                                          null: false
    t.integer "sessiontime",        limit: 8
    t.integer "byproduct",          limit: 2, default: 0
    t.decimal "remainingweight",              default: 0.0
    t.integer "transferredin",      limit: 2, default: 0
    t.integer "transferredintime",  limit: 8
    t.integer "transferredfrom",    limit: 8
    t.integer "transferredto",      limit: 8
    t.integer "productid",          limit: 8
    t.integer "requiresweighing",   limit: 2, default: 1
    t.decimal "quantity"
    t.decimal "pricein",                      default: 0.0
    t.integer "vendorid",           limit: 8
    t.decimal "priceout",                     default: 0.0
    t.integer "deleted",            limit: 2, default: 0
    t.text    "voidedby"
    t.integer "inventorytype",      limit: 2, default: -1
    t.text    "roomdata"
    t.integer "serialid",           limit: 8, default: "nextval('inventory_nonregulated_serialid_seq'::regclass)", null: false
    t.integer "lastaction",         limit: 2
    t.text    "lastuser"
    t.integer "inventory_gl_id",    limit: 8,                                                                      null: false
  end

  create_table "inventory_qa_fail_exempt_requests", id: false, force: true do |t|
    t.integer "id",                     limit: 8, default: "nextval('inventory_qa_fail_exempt_requests_id_seq'::regclass)", null: false
    t.text    "inventoryid"
    t.integer "location",               limit: 8
    t.integer "sessiontime",            limit: 8
    t.integer "deleted",                limit: 2, default: 0
    t.integer "approved",               limit: 2, default: 0
    t.text    "request_reason"
    t.text    "response_reason"
    t.integer "transactionid",          limit: 8
    t.integer "transactionid_original", limit: 8
  end

  add_index "inventory_qa_fail_exempt_requests", ["inventoryid"], name: "inventory_qa_fail_exempt_requests_inventoryid_idx", using: :btree

  create_table "inventoryadjustments", force: true do |t|
    t.string  "inventoryid",            limit: 16
    t.decimal "oldweight",                         default: 0.0
    t.decimal "newweight",                         default: 0.0
    t.decimal "difference",                        default: 0.0
    t.integer "datetime",               limit: 8
    t.text    "userid"
    t.integer "location",               limit: 8,  default: 1
    t.integer "auditid",                limit: 8
    t.text    "reason"
    t.integer "roomid",                 limit: 8
    t.integer "terminalid",             limit: 8
    t.decimal "oldroomweight"
    t.decimal "newroomweight"
    t.text    "overrideuser"
    t.integer "transactionid",          limit: 8
    t.integer "ismedicated",            limit: 2
    t.integer "transactionid_original", limit: 8
    t.integer "replication_val",        limit: 8
  end

  add_index "inventoryadjustments", ["replication_val"], name: "inventoryadjustments_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "inventoryaudits", force: true do |t|
    t.integer "datetime",        limit: 8
    t.text    "userid"
    t.integer "location",        limit: 8, default: 1
    t.integer "accountedfor",    limit: 8
    t.integer "remaining",       limit: 8
    t.text    "unaccountedid"
    t.integer "roomid",          limit: 8
    t.integer "terminalid",      limit: 8
    t.text    "overrideuser"
    t.integer "replication_val", limit: 8
  end

  add_index "inventoryaudits", ["replication_val"], name: "inventoryaudits_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "inventorycombinations", force: true do |t|
    t.string  "newid",           limit: 16
    t.text    "oldid"
    t.integer "sessiontime",     limit: 8
    t.text    "userid"
    t.integer "replication_val", limit: 8
  end

  add_index "inventorycombinations", ["replication_val"], name: "inventorycombinations_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "inventoryconversions", force: true do |t|
    t.text    "inventoryid"
    t.decimal "oldweight",                        default: 0.0
    t.decimal "newweight",                        default: 0.0
    t.decimal "difference",                       default: 0.0
    t.integer "sessiontime",            limit: 8
    t.text    "userid"
    t.integer "transactionid",          limit: 8
    t.text    "childid"
    t.decimal "childweight"
    t.integer "requiresweighing",       limit: 2, default: 1
    t.decimal "waste"
    t.integer "location",               limit: 8
    t.integer "transactionid_original", limit: 8
    t.integer "replication_val",        limit: 8
  end

  add_index "inventoryconversions", ["replication_val"], name: "inventoryconversions_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "inventoryconversions_wa", force: true do |t|
    t.text    "parentid"
    t.text    "parent_quantity_old"
    t.text    "parent_quantity_new"
    t.text    "parent_quantity_difference"
    t.integer "sessiontime",                limit: 8
    t.text    "userid"
    t.integer "transactionid",              limit: 8
    t.text    "inventoryid"
    t.decimal "quantity"
    t.decimal "waste"
    t.integer "location",                   limit: 8
    t.text    "parent_inventorytype"
    t.integer "child_inventorytype",        limit: 2
    t.decimal "usable_weight"
    t.integer "deleted",                    limit: 2, default: 0
    t.integer "transactionid_original",     limit: 8
    t.integer "replication_val",            limit: 8
  end

  add_index "inventoryconversions_wa", ["replication_val"], name: "inventoryconversions_wa_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "inventorygrading", force: true do |t|
    t.text    "name"
    t.text    "pricepoint"
    t.decimal "rateamount"
    t.integer "deleted",         limit: 2, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "inventorygrading", ["replication_val"], name: "inventorygrading_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "inventorygradinglog", primary_key: "logid", force: true do |t|
    t.integer "id",              limit: 8
    t.text    "name"
    t.integer "deleted",         limit: 2, default: 0
    t.text    "pricepoint"
    t.decimal "rateamount"
    t.integer "sessiontime",     limit: 8
    t.text    "lastuser"
    t.integer "lastaction"
    t.integer "replication_val", limit: 8
  end

  add_index "inventorygradinglog", ["replication_val"], name: "inventorygradinglog_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "inventorylabelcustomization", force: true do |t|
    t.text    "generic0"
    t.text    "generic1"
    t.text    "generic2"
    t.text    "generic3"
    t.text    "generic4"
    t.text    "generic5"
    t.text    "generic6"
    t.text    "generic7"
    t.text    "generic8"
    t.text    "generic9"
    t.integer "location",        limit: 8, default: 1
    t.text    "generic10"
    t.integer "replication_val", limit: 8
  end

  add_index "inventorylabelcustomization", ["replication_val"], name: "inventorylabelcustomization_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "inventorylog", primary_key: "logid", force: true do |t|
    t.string  "id",               limit: 16
    t.decimal "currentweight"
    t.decimal "newweight"
    t.integer "sessiontime",      limit: 8
    t.integer "location",         limit: 8
    t.integer "inventorytype",    limit: 2,  default: -1
    t.text    "roomdata"
    t.integer "lastaction",       limit: 2
    t.text    "lastuser"
    t.integer "productid",        limit: 8
    t.integer "grade",            limit: 8
    t.decimal "usableweight"
    t.integer "requiresweighing", limit: 2
    t.text    "newroomdata"
    t.integer "lastroom",         limit: 8
    t.text    "secondaryid"
    t.integer "ismedicated",      limit: 2
    t.integer "replication_val",  limit: 8
    t.integer "currentroom",      limit: 8
    t.integer "newroom",          limit: 8
  end

  add_index "inventorylog", ["replication_val"], name: "inventorylog_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "inventorymoves", force: true do |t|
    t.integer "datetime",        limit: 8
    t.text    "userid"
    t.integer "location",        limit: 8, default: 1
    t.text    "inventoryid"
    t.decimal "weight"
    t.integer "oldroom",         limit: 8
    t.integer "newroom",         limit: 8
    t.integer "replication_val", limit: 8
  end

  add_index "inventorymoves", ["replication_val"], name: "inventorymoves_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "inventoryrooms", force: true do |t|
    t.text    "roomname"
    t.integer "location",               limit: 8, default: 1
    t.integer "deleted",                limit: 2, default: 0
    t.integer "quarantine",             limit: 2, default: 0
    t.integer "transactionid",          limit: 8
    t.integer "transactionid_original", limit: 8
    t.integer "replication_val",        limit: 8
  end

  add_index "inventoryrooms", ["replication_val"], name: "inventoryrooms_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "inventorysamples", force: true do |t|
    t.integer "sample_type",            limit: 2
    t.text    "employee_id"
    t.text    "vendor_id"
    t.text    "inventoryid"
    t.decimal "quantity"
    t.integer "sessiontime",            limit: 8
    t.integer "transactionid",          limit: 8
    t.integer "transactionid_original", limit: 8
    t.integer "location",               limit: 8
    t.integer "deleted",                limit: 2, default: 0
    t.integer "replication_val",        limit: 8
    t.text    "sample_inventoryid"
  end

  add_index "inventorysamples", ["replication_val"], name: "inventorysamples_replication_idx", where: "(replication_val > 0)", using: :btree
  add_index "inventorysamples", ["sample_inventoryid"], name: "inventorysamples_inventoryid_idx", using: :btree

  create_table "inventorytesting", force: true do |t|
    t.integer "ttype",           limit: 2
    t.decimal "tamount"
    t.text    "tunit"
    t.integer "tlessthan",       limit: 2
    t.text    "plantid"
    t.integer "sessiontime",     limit: 8
    t.integer "deleted",         limit: 2, default: 0
    t.text    "inventoryid"
    t.text    "docdata"
    t.text    "docname"
    t.integer "labid",           limit: 8
    t.integer "replication_val", limit: 8
  end

  add_index "inventorytesting", ["replication_val"], name: "inventorytesting_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "inventorytestingtypes", force: true do |t|
    t.text    "name"
    t.text    "tdetails"
    t.text    "tunits"
    t.integer "deleted",         limit: 2, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "inventorytestingtypes", ["replication_val"], name: "inventorytestingtypes_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "inventorytransferoptions", force: true do |t|
    t.integer "enabled",                limit: 2, default: 0
    t.integer "allowrptingcorrections", limit: 2, default: 0
    t.integer "replication_val",        limit: 8
  end

  add_index "inventorytransferoptions", ["replication_val"], name: "inventorytransferoptions_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "inventorytransfers", force: true do |t|
    t.string  "inventoryid",            limit: 16
    t.integer "sessiontime",            limit: 8
    t.text    "strain"
    t.text    "straintype"
    t.decimal "weight",                            default: 0.0
    t.integer "transactionid",          limit: 8
    t.integer "location",               limit: 8,  default: 1
    t.integer "requiresweighing",       limit: 2,  default: 1
    t.integer "direction",              limit: 2,  default: 0
    t.integer "transfertype",           limit: 2,  default: 0
    t.integer "vendorid",               limit: 8
    t.text    "userid"
    t.integer "transferlocationid",     limit: 8
    t.text    "transferorgname"
    t.text    "transferuserid"
    t.integer "partial",                limit: 2,  default: 0
    t.string  "parentid",               limit: 16
    t.decimal "price",                             default: 0.0
    t.integer "productid",              limit: 8
    t.integer "ismedicated",            limit: 2,  default: 1
    t.integer "inventorytype",          limit: 2,  default: -1
    t.integer "ticketid",               limit: 8
    t.text    "batchno"
    t.integer "terminalid",             limit: 8
    t.integer "deleted",                limit: 2,  default: 0
    t.integer "labid",                  limit: 8
    t.text    "vendorlicense"
    t.text    "manifestid"
    t.integer "manifest_stop"
    t.text    "description"
    t.integer "is_refund",              limit: 2
    t.decimal "refund_amount"
    t.integer "transactionid_original", limit: 8
    t.integer "replication_val",        limit: 8
    t.text    "productname"
    t.integer "growdestined",           limit: 2
  end

  add_index "inventorytransfers", ["replication_val"], name: "inventorytransfers_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "inventorytransfers_log", force: true do |t|
    t.integer "transferid",             limit: 8
    t.text    "inventoryid"
    t.integer "sessiontime",            limit: 8
    t.text    "strain"
    t.text    "straintype"
    t.decimal "weight",                            default: 0.0
    t.integer "transactionid",          limit: 8
    t.integer "location",               limit: 8,  default: 1
    t.integer "requiresweighing",       limit: 2,  default: 1
    t.integer "direction",              limit: 2,  default: 0
    t.integer "transfertype",           limit: 2,  default: 0
    t.integer "vendorid",               limit: 8
    t.text    "userid"
    t.integer "transferlocationid",     limit: 8
    t.text    "transferorgname"
    t.text    "transferuserid"
    t.integer "partial",                limit: 2,  default: 0
    t.string  "parentid",               limit: 16
    t.decimal "price",                             default: 0.0
    t.integer "productid",              limit: 8
    t.integer "ismedicated",            limit: 2,  default: 1
    t.integer "inventorytype",          limit: 2,  default: -1
    t.integer "ticketid",               limit: 8
    t.text    "batchno"
    t.integer "terminalid",             limit: 8
    t.integer "deleted",                limit: 2,  default: 0
    t.integer "transactionid_original", limit: 8
    t.integer "replication_val",        limit: 8
  end

  add_index "inventorytransfers_log", ["replication_val"], name: "inventorytransfers_log_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "inventorytypes", force: true do |t|
    t.text    "name"
    t.integer "canbecollected",      limit: 2, default: 0
    t.integer "retail",              limit: 2, default: 1
    t.integer "harvest",             limit: 2, default: 0
    t.integer "cure",                limit: 2, default: 0
    t.integer "canbeharvested",      limit: 2, default: 0
    t.integer "canbecured",          limit: 2, default: 0
    t.integer "defaultbatchharvest", limit: 2, default: 0
    t.integer "defaultbatchcure",    limit: 2, default: 0
    t.integer "harvestorder",        limit: 2, default: 0
    t.integer "cureorder",           limit: 2, default: 0
    t.integer "deleted",             limit: 2, default: 0
    t.integer "replication_val",     limit: 8
  end

  add_index "inventorytypes", ["replication_val"], name: "inventorytypes_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "inventorytypes_hash", force: true do |t|
    t.text "precursor_forward"
    t.text "precursor_backward"
    t.text "precursor_mandatory"
    t.text "precursor_mandatory_qa"
  end

  create_table "inventorytypes_wa", force: true do |t|
    t.text    "name"
    t.integer "canbecollected",       limit: 2, default: 0
    t.integer "retail",               limit: 2, default: 1
    t.integer "harvest",              limit: 2, default: 0
    t.integer "cure",                 limit: 2, default: 0
    t.integer "canbeharvested",       limit: 2, default: 0
    t.integer "canbecured",           limit: 2, default: 0
    t.integer "defaultbatchharvest",  limit: 2, default: 0
    t.integer "defaultbatchcure",     limit: 2, default: 0
    t.integer "harvestorder",         limit: 2, default: 0
    t.integer "cureorder",            limit: 2, default: 0
    t.integer "deleted",              limit: 2, default: 0
    t.integer "requiresusable",       limit: 2, default: 0
    t.integer "requiresweighing",     limit: 2, default: 0
    t.integer "canbesource",          limit: 2, default: 0
    t.integer "canbelotted",          limit: 2, default: 0
    t.integer "canbesublotted",       limit: 2, default: 0
    t.integer "canbesampled",         limit: 2, default: 0
    t.integer "producertoproducer",   limit: 2, default: 0
    t.integer "producertoprocessor",  limit: 2, default: 0
    t.integer "processortoprocessor", limit: 2, default: 0
    t.integer "processortoretailer",  limit: 2, default: 0
    t.integer "retailertoretailer",   limit: 2, default: 0
    t.integer "retailertoprocessor",  limit: 2, default: 0
    t.integer "convertone",           limit: 2, default: 0
    t.integer "converttwo",           limit: 2, default: 0
    t.integer "convertthree",         limit: 2, default: 0
    t.integer "package_weight_type",  limit: 2, default: 0
    t.integer "transfer_qa",          limit: 2, default: 0
    t.integer "bypass_qa_allowed",    limit: 2, default: 0
    t.decimal "qa_sample_limit"
  end

  create_table "itemrows", id: false, force: true do |t|
    t.integer "itemsetting", limit: 2, default: 1
    t.integer "itemview",    limit: 2, default: 0
  end

  create_table "kushitqueue", force: true do |t|
    t.integer "pid",      limit: 8
    t.integer "paction",  limit: 2
    t.integer "location", limit: 8, default: 1
    t.integer "oldks",    limit: 2
  end

  create_table "labelcustomization", force: true do |t|
    t.text    "generic0"
    t.text    "generic1"
    t.text    "generic2"
    t.text    "generic3"
    t.text    "generic4"
    t.text    "generic5"
    t.text    "generic6"
    t.text    "generic7"
    t.text    "generic8"
    t.text    "generic9"
    t.integer "location",        limit: 8, default: 1
    t.text    "generic10"
    t.integer "replication_val", limit: 8
  end

  add_index "labelcustomization", ["replication_val"], name: "labelcustomization_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "labeltemplates", force: true do |t|
    t.text    "label_name"
    t.integer "source",          limit: 2, default: 0
    t.integer "deleted",         limit: 2, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "labeltemplates", ["replication_val"], name: "labeltemplates_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "labeltemplates_data", force: true do |t|
    t.text    "generic0"
    t.text    "generic1"
    t.text    "generic2"
    t.text    "generic3"
    t.text    "generic4"
    t.text    "generic5"
    t.text    "generic6"
    t.text    "generic7"
    t.text    "generic8"
    t.text    "generic9"
    t.text    "generic10"
    t.integer "label_id",        limit: 8
    t.integer "deleted",         limit: 2, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "labeltemplates_data", ["replication_val"], name: "labeltemplates_data_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "laboratories", force: true do |t|
    t.text     "name"
    t.text     "address1"
    t.text     "address2"
    t.text     "city"
    t.text     "state"
    t.text     "zip"
    t.text     "phone"
    t.integer  "deleted",         limit: 2, default: 0
    t.text     "licensenum"
    t.text     "qblistid"
    t.text     "qbresponse"
    t.datetime "created",                   default: "now()"
    t.datetime "modified"
    t.text     "fax"
    t.text     "email"
    t.text     "website"
    t.text     "description"
    t.text     "contact"
    t.integer  "replication_val", limit: 8
  end

  add_index "laboratories", ["replication_val"], name: "laboratories_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "labs_temp", force: true do |t|
    t.text     "name"
    t.text     "address1"
    t.text     "address2"
    t.text     "city"
    t.text     "state"
    t.text     "zip"
    t.text     "phone"
    t.integer  "deleted",                limit: 2, default: 0
    t.text     "licensenum"
    t.text     "qblistid"
    t.text     "qbresponse"
    t.datetime "created",                          default: "now()"
    t.datetime "modified"
    t.text     "fax"
    t.integer  "mip",                    limit: 2, default: 0
    t.text     "email"
    t.text     "website"
    t.text     "description"
    t.text     "contact"
    t.text     "customerid"
    t.text     "licensetypecode"
    t.integer  "producer",               limit: 2, default: 0
    t.integer  "processor",              limit: 2, default: 0
    t.integer  "retail",                 limit: 2, default: 0
    t.integer  "locationtype",           limit: 2, default: 0
    t.text     "ubi"
    t.integer  "transactionid",          limit: 8
    t.integer  "transactionid_original", limit: 8
    t.integer  "replication_val",        limit: 8
  end

  add_index "labs_temp", ["replication_val"], name: "labs_temp_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "local_replication_sync", force: true do |t|
    t.text    "table_name"
    t.integer "status",          limit: 2, default: 0
    t.integer "replication_val", limit: 8
    t.integer "history_id",      limit: 8
  end

  create_table "local_replication_sync_initial", force: true do |t|
    t.integer "replication_val", limit: 8
    t.integer "history_id",      limit: 8
  end

  create_table "locations", force: true do |t|
    t.text    "name"
    t.text    "address1"
    t.text    "address2"
    t.text    "city"
    t.string  "state",           limit: 2
    t.string  "zip",             limit: 9
    t.text    "phone"
    t.text    "website"
    t.integer "deleted",         limit: 2, default: 0
    t.integer "locationtype",    limit: 2, default: 0
    t.text    "licensenum"
    t.text    "fax"
    t.integer "mip",             limit: 2, default: 0
    t.integer "kushit",          limit: 2
    t.text    "growlicensenum"
    t.integer "medical",         limit: 2, default: 1
    t.integer "producer",        limit: 2, default: 0
    t.integer "processor",       limit: 2, default: 0
    t.integer "retail",          limit: 2, default: 0
    t.text    "plantlimit"
    t.text    "colorscheme",               default: "#ffffff:#000000:#000000:#004BE1:#ffffff:#000000:#EDEDED:#FFFFBF"
    t.integer "replication_val", limit: 8
  end

  add_index "locations", ["replication_val"], name: "locations_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "logooptions", force: true do |t|
    t.text    "name"
    t.integer "uselogopo",       limit: 2, default: 0
    t.text    "myimage"
    t.integer "pwidth",          limit: 8
    t.integer "pheight",         limit: 8
    t.integer "uselogoreceipt",  limit: 2, default: 0
    t.integer "rwidth",          limit: 8
    t.integer "rheight",         limit: 8
    t.integer "replication_val", limit: 8
  end

  add_index "logooptions", ["replication_val"], name: "logooptions_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "logs", force: true do |t|
    t.integer "logtime",         limit: 8
    t.text    "logtext"
    t.boolean "importance"
    t.text    "logbody"
    t.integer "replication_val", limit: 8
  end

  add_index "logs", ["replication_val"], name: "logs_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "loyaltylabelcustomization", force: true do |t|
    t.text    "generic0"
    t.text    "generic1"
    t.text    "generic2"
    t.text    "generic3"
    t.text    "generic4"
    t.text    "generic5"
    t.text    "generic6"
    t.text    "generic7"
    t.text    "generic8"
    t.text    "generic9"
    t.integer "side",            limit: 2, default: 1
    t.integer "replication_val", limit: 8
  end

  add_index "loyaltylabelcustomization", ["replication_val"], name: "loyaltylabelcustomization_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "loyaltypoints", force: true do |t|
    t.integer "location",         limit: 8, default: 1
    t.integer "enabled",          limit: 2, default: 1
    t.decimal "pointsearned",               default: 1.0
    t.integer "memberonly",       limit: 2, default: 0
    t.decimal "redemptionvalue"
    t.decimal "redemptionpoints"
    t.decimal "referralpoints",             default: 0.0
    t.integer "istaxable",        limit: 2, default: 0
    t.integer "replication_val",  limit: 8
  end

  add_index "loyaltypoints", ["replication_val"], name: "loyaltypoints_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "loyaltyprograms", force: true do |t|
    t.text    "name"
    t.integer "loyaltytype",      limit: 2, default: 0
    t.decimal "loyaltycount"
    t.integer "loyaltyqualifier", limit: 2, default: 1
    t.text    "productqualifier"
    t.integer "location",         limit: 2, default: 1
    t.text    "priceoverride"
    t.decimal "discount",                   default: 0.0
    t.integer "ispercentagerate", limit: 2, default: 0
    t.integer "maxproducts",      limit: 2, default: 0
    t.text    "code"
    t.integer "deleted",          limit: 2, default: 0
    t.integer "istaxable",        limit: 2, default: 0
    t.integer "cumulative",       limit: 2, default: 0
    t.integer "memberonly",       limit: 2, default: 0
    t.integer "replication_val",  limit: 8
  end

  add_index "loyaltyprograms", ["replication_val"], name: "loyaltyprograms_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "lucysettings", force: true do |t|
    t.integer "location",        limit: 8
    t.text    "username"
    t.text    "password"
    t.text    "hostname"
    t.integer "active",          limit: 2, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "lucysettings", ["replication_val"], name: "lucysettings_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "manifestoptions", force: true do |t|
    t.integer "shareopc",        limit: 2, default: 0
    t.text    "email"
    t.integer "inventoryassist", limit: 2, default: 1
    t.integer "replication_val", limit: 8
  end

  add_index "manifestoptions", ["replication_val"], name: "manifestoptions_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "manifestsmtpsettings", force: true do |t|
    t.text    "email"
    t.text    "password"
    t.text    "smtpaddress"
    t.integer "smtpport"
    t.integer "smtpssl",         limit: 2, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "manifestsmtpsettings", ["replication_val"], name: "manifestsmtpsettings_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "manifeststopscache", force: true do |t|
    t.integer "departureid",                null: false
    t.integer "arrivalid",                  null: false
    t.text    "routetext",                  null: false
    t.text    "duration_seconds"
    t.integer "replication_val",  limit: 8
  end

  add_index "manifeststopscache", ["replication_val"], name: "manifeststopscache_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "manifeststopsexcels", force: true do |t|
    t.text     "manifestid",                                  null: false
    t.datetime "ts",                        default: "now()"
    t.integer  "replication_val", limit: 8
  end

  add_index "manifeststopsexcels", ["replication_val"], name: "manifeststopsexcels_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "manifeststopsitems", force: true do |t|
    t.text    "manifestid",                null: false
    t.integer "stopnumber",                null: false
    t.decimal "amount",                    null: false
    t.text    "barcode",                   null: false
    t.integer "sessiontime",     limit: 8
    t.text    "userid"
    t.integer "replication_val", limit: 8
  end

  add_index "manifeststopsitems", ["replication_val"], name: "manifeststopsitems_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "manifeststopsoverview", force: true do |t|
    t.text    "manifestid",                null: false
    t.integer "stopnumber",                null: false
    t.integer "departureid"
    t.integer "arrivalid"
    t.text    "departurename"
    t.text    "arrivalname"
    t.text    "userid"
    t.integer "sessiontime",     limit: 8
    t.integer "replication_val", limit: 8
  end

  add_index "manifeststopsoverview", ["replication_val"], name: "manifeststopsoverview_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "mdiscount", force: true do |t|
    t.integer "enabled",         limit: 2, default: 0
    t.integer "location",        limit: 8, default: 1
    t.integer "autofallback",    limit: 2, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "mdiscount", ["replication_val"], name: "mdiscount_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "memberdiscount", force: true do |t|
    t.decimal "rate",                      default: 0.0
    t.integer "enabled",         limit: 2, default: 0
    t.integer "location",        limit: 8, default: 1
    t.text    "membername"
    t.integer "deleted",         limit: 2, default: 0
    t.integer "caregiver",       limit: 2, default: 1
    t.integer "replication_val", limit: 8
  end

  add_index "memberdiscount", ["replication_val"], name: "memberdiscount_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "messages", force: true do |t|
    t.text    "sender"
    t.text    "receiver"
    t.text    "owner"
    t.integer "newflag",         limit: 2, default: 1
    t.integer "importance",      limit: 2, default: 0
    t.integer "sendtime",        limit: 8
    t.text    "subject"
    t.text    "messagebody"
    t.integer "replication_val", limit: 8
  end

  add_index "messages", ["owner"], name: "messages_owner_index", using: :btree
  add_index "messages", ["replication_val"], name: "messages_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "miscdata", force: true do |t|
    t.text    "key"
    t.text    "value"
    t.integer "mytime",          limit: 8
    t.integer "location",        limit: 8
    t.integer "replication_val", limit: 8
  end

  add_index "miscdata", ["replication_val"], name: "miscdata_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "miscoptions", force: true do |t|
    t.text    "key"
    t.text    "value"
    t.integer "replication_val", limit: 8
  end

  add_index "miscoptions", ["replication_val"], name: "miscoptions_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "myterminal", id: false, force: true do |t|
    t.text "uuid"
    t.text "counter"
  end

  create_table "offlinebatch", force: true do |t|
    t.integer "batchtype",       limit: 2, default: 0
    t.text    "batchtext"
    t.integer "replication_val", limit: 8
  end

  add_index "offlinebatch", ["replication_val"], name: "offlinebatch_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "offlinedata", force: true do |t|
    t.text    "myquery"
    t.text    "mydata"
    t.integer "deleted",       limit: 2, default: 0
    t.integer "transactionid", limit: 8
    t.integer "training",      limit: 2, default: 0
    t.integer "action_set",              default: 0
  end

  create_table "orgdata", force: true do |t|
    t.text    "orgname"
    t.integer "orgid",           limit: 8
    t.text    "orgunique"
    t.integer "replication_val", limit: 8
  end

  add_index "orgdata", ["replication_val"], name: "orgdata_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "payment_terms", id: false, force: true do |t|
    t.integer "id",       limit: 8, default: "nextval('payment_terms_id_seq'::regclass)", null: false
    t.text    "name"
    t.integer "active",   limit: 2, default: 1
    t.integer "location", limit: 8, default: 1
  end

  create_table "paymentmethods", force: true do |t|
    t.text    "name"
    t.integer "active",          limit: 2, default: 1
    t.integer "myorder",         limit: 2
    t.integer "location",        limit: 8, default: 1
    t.integer "replication_val", limit: 8
  end

  add_index "paymentmethods", ["replication_val"], name: "paymentmethods_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "paymentmodifications", force: true do |t|
    t.integer "sessiontime",     limit: 8
    t.integer "paymentid",       limit: 8
    t.decimal "oldamount"
    t.decimal "newamount"
    t.text    "oldmethod"
    t.text    "newmethod"
    t.integer "oldterminal",     limit: 8
    t.integer "newterminal",     limit: 8
    t.integer "replication_val", limit: 8
  end

  add_index "paymentmodifications", ["replication_val"], name: "paymentmodifications_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "payments", force: true do |t|
    t.string  "ticketid",        limit: 16
    t.text    "paymentmethod"
    t.decimal "paymentamount"
    t.decimal "amount"
    t.string  "customerid",      limit: 10
    t.integer "datetime",        limit: 8
    t.text    "approvalcode"
    t.integer "deleted",         limit: 2,  default: 0
    t.text    "pnref"
    t.text    "hostcode"
    t.integer "refunded",        limit: 2,  default: 0
    t.integer "location",        limit: 8,  default: 1
    t.string  "refticketid",     limit: 16
    t.integer "terminalid",      limit: 8
    t.decimal "pointsused"
    t.integer "replication_val", limit: 8
    t.integer "on_account",      limit: 2
    t.text    "zip_code"
  end

  add_index "payments", ["replication_val"], name: "payments_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "payments_log", primary_key: "logid", force: true do |t|
    t.integer "id",              limit: 8
    t.text    "ticketid"
    t.text    "paymentmethod"
    t.decimal "paymentamount"
    t.decimal "amount"
    t.text    "customerid"
    t.integer "datetime",        limit: 8
    t.text    "approvalcode"
    t.integer "deleted",         limit: 2
    t.text    "pnref"
    t.text    "hostcode"
    t.integer "refunded",        limit: 2
    t.integer "location",        limit: 8
    t.text    "refticketid"
    t.integer "terminalid",      limit: 8
    t.decimal "pointsused"
    t.integer "lastaction"
    t.text    "lastuser"
    t.integer "sessiontime",     limit: 8
    t.integer "replication_val", limit: 8
  end

  add_index "payments_log", ["replication_val"], name: "payments_log_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "payouts", force: true do |t|
    t.decimal "amount"
    t.text    "reason"
    t.integer "terminalid",      limit: 8
    t.integer "location",        limit: 8, default: 1
    t.text    "userid"
    t.integer "datetime",        limit: 8
    t.integer "deleted",         limit: 2, default: 0
    t.text    "voiduser"
    t.integer "replication_val", limit: 8
  end

  add_index "payouts", ["replication_val"], name: "payouts_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "pdfcompression", id: false, force: true do |t|
    t.integer "active",          limit: 2, default: 0
    t.text    "compressiontype"
  end

  create_table "pharmacists", force: true do |t|
    t.text    "first"
    t.text    "last"
    t.text    "middle"
    t.text    "address1"
    t.text    "address2"
    t.text    "city"
    t.string  "state",           limit: 2
    t.string  "zip",             limit: 10
    t.text    "title"
    t.text    "phone"
    t.text    "fax"
    t.text    "dea"
    t.integer "inactive",        limit: 2,  default: 0
    t.integer "deleted",         limit: 2,  default: 0
    t.text    "licensenum"
    t.text    "website"
    t.integer "replication_val", limit: 8
  end

  add_index "pharmacists", ["replication_val"], name: "pharmacists_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "phases", force: true do |t|
    t.text    "strain"
    t.integer "phase",           limit: 2
    t.text    "phasename"
    t.integer "timelengthlow",   limit: 8
    t.integer "timelengthhigh",  limit: 8
    t.integer "replication_val", limit: 8
  end

  add_index "phases", ["replication_val"], name: "phases_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "phasesize", force: true do |t|
    t.integer "phasewidth",      limit: 2, default: 24
    t.integer "phaseheight",     limit: 2, default: 47
    t.integer "replication_val", limit: 8
  end

  add_index "phasesize", ["replication_val"], name: "phasesize_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "phasetext", force: true do |t|
    t.text    "phasename"
    t.integer "myorder",         limit: 2
    t.integer "deleted",         limit: 2, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "phasetext", ["replication_val"], name: "phasetext_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "plantadditives", force: true do |t|
    t.integer "additive",        limit: 8
    t.text    "plantid"
    t.integer "sessiontime",     limit: 8
    t.integer "location",        limit: 8, default: 1
    t.integer "deleted",         limit: 2, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "plantadditives", ["plantid"], name: "plantadditives_plantid", using: :btree
  add_index "plantadditives", ["replication_val"], name: "plantadditives_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "plantaudits", force: true do |t|
    t.integer "auditid",     limit: 8
    t.text    "plantid"
    t.integer "sessiontime", limit: 8
    t.text    "userid"
    t.integer "location",    limit: 8
    t.integer "checked",     limit: 2, default: 0
    t.integer "deleted",     limit: 2, default: 0
    t.integer "oldroomid",   limit: 8
    t.integer "newroomid",   limit: 8
  end

  create_table "plantderivatives", force: true do |t|
    t.text    "plantid"
    t.integer "sessiontime",            limit: 8
    t.integer "drytimestart",           limit: 8
    t.integer "drytimeend",             limit: 8
    t.decimal "wetweight",                        default: 0.0
    t.decimal "budweight",                        default: 0.0
    t.decimal "pretrimweight",                    default: 0.0
    t.integer "pretrimroom",            limit: 8
    t.integer "pretrimaccountedfor",    limit: 2, default: 0
    t.integer "harvestroom",            limit: 8
    t.decimal "stemweight",                       default: 0.0
    t.integer "stemaccountedfor",       limit: 2, default: 0
    t.decimal "sugarleafweight",                  default: 0.0
    t.integer "sugarleafaccountedfor",  limit: 2, default: 0
    t.decimal "shakeweight",                      default: 0.0
    t.integer "shakeaccountedfor",      limit: 2, default: 0
    t.decimal "kiefweight",                       default: 0.0
    t.integer "kiefaccountedfor",       limit: 2, default: 0
    t.integer "budsaccountedfor",       limit: 2, default: 0
    t.decimal "fanleafweight",                    default: 0.0
    t.integer "fanleafaccountedfor",    limit: 2, default: 0
    t.integer "stemroom",               limit: 8
    t.integer "sugarleafroom",          limit: 8
    t.integer "kiefroom",               limit: 8
    t.decimal "otherweight"
    t.integer "otheraccountedfor",      limit: 2, default: 0
    t.integer "otherroom",              limit: 8
    t.integer "stemtime",               limit: 8
    t.integer "sugarleaftime",          limit: 8
    t.integer "kieftime",               limit: 8
    t.integer "fanleaftime",            limit: 8
    t.integer "othertime",              limit: 8
    t.integer "pretrimtime",            limit: 8
    t.integer "shakeroom",              limit: 8
    t.integer "wetroom",                limit: 8
    t.integer "fanleafroom",            limit: 8
    t.integer "shaketime",              limit: 8
    t.integer "harvestcollect",         limit: 2
    t.integer "curecollect",            limit: 2
    t.integer "transactionid",          limit: 8
    t.decimal "wasteweight"
    t.integer "wasteaccountedfor",      limit: 2, default: 0
    t.integer "wasteroom",              limit: 8
    t.integer "wastetime",              limit: 8
    t.integer "location",               limit: 8
    t.integer "deleted",                limit: 2
    t.integer "inventorytype",          limit: 2
    t.decimal "dweight"
    t.decimal "dwholeweight"
    t.integer "daccountedfor",          limit: 2
    t.integer "addlcollections",        limit: 2
    t.integer "droom",                  limit: 8
    t.integer "transactionid_original", limit: 8
    t.integer "replication_val",        limit: 8
  end

  add_index "plantderivatives", ["replication_val"], name: "plantderivatives_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "plantderivatives_log", force: true do |t|
    t.integer "pid",                   limit: 8
    t.text    "plantid"
    t.integer "sessiontime",           limit: 8
    t.integer "drytimestart",          limit: 8
    t.integer "drytimeend",            limit: 8
    t.decimal "wetweight",                       default: 0.0
    t.decimal "budweight",                       default: 0.0
    t.decimal "pretrimweight",                   default: 0.0
    t.integer "pretrimroom",           limit: 8
    t.integer "pretrimaccountedfor",   limit: 2, default: 0
    t.integer "harvestroom",           limit: 8
    t.decimal "stemweight",                      default: 0.0
    t.integer "stemaccountedfor",      limit: 2, default: 0
    t.decimal "sugarleafweight",                 default: 0.0
    t.integer "sugarleafaccountedfor", limit: 2, default: 0
    t.decimal "shakeweight",                     default: 0.0
    t.integer "shakeaccountedfor",     limit: 2, default: 0
    t.decimal "kiefweight",                      default: 0.0
    t.integer "kiefaccountedfor",      limit: 2, default: 0
    t.integer "budsaccountedfor",      limit: 2, default: 0
    t.decimal "fanleafweight",                   default: 0.0
    t.integer "fanleafaccountedfor",   limit: 2, default: 0
    t.integer "stemroom",              limit: 8
    t.integer "sugarleafroom",         limit: 8
    t.integer "kiefroom",              limit: 8
    t.decimal "otherweight"
    t.integer "otheraccountedfor",     limit: 2, default: 0
    t.integer "otherroom",             limit: 8
    t.integer "stemtime",              limit: 8
    t.integer "sugarleaftime",         limit: 8
    t.integer "kieftime",              limit: 8
    t.integer "fanleaftime",           limit: 8
    t.integer "othertime",             limit: 8
    t.integer "pretrimtime",           limit: 8
    t.integer "shakeroom",             limit: 8
    t.integer "wetroom",               limit: 8
    t.integer "fanleafroom",           limit: 8
    t.integer "shaketime",             limit: 8
    t.integer "harvestcollect",        limit: 2
    t.integer "curecollect",           limit: 2
    t.decimal "wasteweight"
    t.integer "wasteaccountedfor",     limit: 2
    t.integer "wasteroom",             limit: 8
    t.integer "wastetime",             limit: 8
    t.integer "replication_val",       limit: 8
  end

  add_index "plantderivatives_log", ["replication_val"], name: "plantderivatives_log_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "plantgroups", force: true do |t|
    t.text    "groupname"
    t.integer "sessiontime",     limit: 8
    t.integer "deleted",         limit: 2, default: 0
    t.integer "location",        limit: 8, default: 1
    t.integer "plantcount",      limit: 8, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "plantgroups", ["replication_val"], name: "plantgroups_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "plantnotes", force: true do |t|
    t.integer "sessiontime",     limit: 8
    t.integer "plantid",         limit: 8
    t.text    "note"
    t.text    "userid"
    t.text    "plantstate"
    t.text    "plantphase"
    t.integer "groupid",         limit: 8
    t.integer "groupnoteid",     limit: 8
    t.integer "replication_val", limit: 8
  end

  add_index "plantnotes", ["replication_val"], name: "plantnotes_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "plantphasechanges", force: true do |t|
    t.string  "plantid",         limit: 16
    t.integer "newphase",        limit: 2,  default: 0
    t.integer "newphasetime",    limit: 8
    t.integer "drying",          limit: 2,  default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "plantphasechanges", ["replication_val"], name: "plantphasechanges_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "plants", force: true do |t|
    t.text    "strain"
    t.integer "sessiontime",            limit: 8
    t.integer "transactionid",          limit: 8
    t.decimal "wetweight",                         default: 0.0
    t.integer "drytimestart",           limit: 8
    t.integer "drytimeend",             limit: 8
    t.decimal "budweight",                         default: 0.0
    t.integer "seed",                   limit: 2,  default: 0
    t.integer "phase",                  limit: 2,  default: 0
    t.integer "lastmanualphase",        limit: 8
    t.integer "dryphase",               limit: 2
    t.integer "lastmanualdryphase",     limit: 8
    t.integer "remindertime",           limit: 8
    t.integer "reminderon",             limit: 2
    t.integer "gridx",                  limit: 2
    t.integer "gridy",                  limit: 2
    t.string  "parentid",               limit: 16
    t.integer "deleted",                limit: 2,  default: 0
    t.text    "deletereason"
    t.integer "deletetime",             limit: 8
    t.text    "deletedby"
    t.integer "location",               limit: 8,  default: 1
    t.integer "room",                   limit: 8,  default: 1
    t.integer "state",                  limit: 2,  default: 0
    t.decimal "pretrimweight",                     default: 0.0
    t.integer "pretrimroom",            limit: 8
    t.integer "pretrimaccountedfor",    limit: 2,  default: 0
    t.integer "harvestroom",            limit: 8
    t.decimal "stemweight",                        default: 0.0
    t.integer "stemaccountedfor",       limit: 2,  default: 0
    t.decimal "sugarleafweight",                   default: 0.0
    t.integer "sugarleafaccountedfor",  limit: 2,  default: 0
    t.decimal "shakeweight",                       default: 0.0
    t.integer "shakeaccountedfor",      limit: 2,  default: 0
    t.decimal "kiefweight",                        default: 0.0
    t.integer "kiefaccountedfor",       limit: 2,  default: 0
    t.integer "lastroommove",           limit: 8
    t.integer "budsaccountedfor",       limit: 2,  default: 0
    t.integer "groupid",                limit: 8
    t.text    "patientid"
    t.integer "cloneconverted",         limit: 2,  default: 0
    t.decimal "fanleafweight"
    t.integer "fanleafaccountedfor",    limit: 2,  default: 0
    t.integer "stemroom",               limit: 8
    t.integer "sugarleafroom",          limit: 8
    t.integer "kiefroom",               limit: 8
    t.integer "fanleafroom",            limit: 8
    t.decimal "otherweight"
    t.integer "otheraccountedfor",      limit: 2,  default: 0
    t.integer "otherroom",              limit: 8
    t.integer "shakeroom",              limit: 8
    t.integer "stemtime",               limit: 8
    t.integer "sugarleaftime",          limit: 8
    t.integer "kieftime",               limit: 8
    t.integer "fanleaftime",            limit: 8
    t.integer "othertime",              limit: 8
    t.integer "wetroom",                limit: 8
    t.integer "pretrimtime",            limit: 8
    t.integer "harvestgroupid",         limit: 8
    t.integer "shaketime",              limit: 8
    t.integer "destinationlocation",    limit: 2
    t.integer "mother",                 limit: 2,  default: 0
    t.integer "lastadditive",           limit: 8
    t.integer "lastadditivetime",       limit: 8
    t.integer "curegroupid",            limit: 8
    t.text    "pcustomerid"
    t.integer "harvestcollect",         limit: 2
    t.integer "curecollect",            limit: 2
    t.integer "vendorid",               limit: 8
    t.integer "quarantine",             limit: 2
    t.integer "quarantinetime",         limit: 8
    t.text    "quarantinereason"
    t.integer "harvestscheduled",       limit: 2
    t.integer "harvestscheduletime",    limit: 8
    t.decimal "wasteweight"
    t.integer "wasteaccountedfor",      limit: 2,  default: 0
    t.integer "wasteroom",              limit: 8
    t.integer "wastetime",              limit: 8
    t.text    "secondaryid"
    t.integer "seized",                 limit: 2
    t.integer "transactionid_original", limit: 8
    t.integer "replication_val",        limit: 8
    t.integer "orig_vendor_po_id"
    t.integer "orig_vendor_po_linenum", limit: 2
    t.text    "inventory_parent_id"
  end

  add_index "plants", ["replication_val"], name: "plants_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "plantslog", primary_key: "logid", force: true do |t|
    t.string  "id",              limit: 16
    t.integer "oldroom",         limit: 8
    t.integer "newroom",         limit: 8
    t.integer "oldphase",        limit: 2
    t.integer "newphase",        limit: 2
    t.integer "olddryphase",     limit: 2
    t.integer "newdryphase",     limit: 2
    t.integer "oldstate",        limit: 2
    t.integer "newstate",        limit: 2
    t.integer "sessiontime",     limit: 8
    t.integer "gridx",           limit: 2
    t.integer "gridy",           limit: 2
    t.integer "replication_val", limit: 8
  end

  add_index "plantslog", ["replication_val"], name: "plantslog_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "planttables", force: true do |t|
    t.text    "name"
    t.integer "location",        limit: 8
    t.integer "deleted",         limit: 2, default: 0
    t.integer "room",            limit: 8
    t.integer "gridx",           limit: 8
    t.integer "gridy",           limit: 8
    t.integer "replication_val", limit: 8
  end

  add_index "planttables", ["replication_val"], name: "planttables_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "plantwetweights", force: true do |t|
    t.text    "plantid"
    t.decimal "weight"
    t.integer "sessiontime",     limit: 8
    t.integer "deleted",         limit: 2, default: 0
    t.integer "location",        limit: 8, default: 1
    t.text    "userid"
    t.integer "replication_val", limit: 8
  end

  add_index "plantwetweights", ["replication_val"], name: "plantwetweights_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "pooldata", force: true do |t|
    t.integer "customers",                 limit: 2, default: 1
    t.integer "strains",                   limit: 2, default: 1
    t.integer "products",                  limit: 2, default: 0
    t.integer "productcategories",         limit: 2, default: 0
    t.integer "discount",                  limit: 2, default: 0
    t.integer "tax",                       limit: 2, default: 0
    t.integer "containers",                limit: 2, default: 0
    t.integer "loyalty",                   limit: 2, default: 0
    t.integer "productpricing",            limit: 2, default: 0
    t.integer "separateproductcategories", limit: 2, default: 0
    t.integer "providers",                 limit: 2, default: 1
    t.integer "tasks",                     limit: 2, default: 0
    t.integer "tasktemplates",             limit: 2, default: 0
    t.integer "replication_val",           limit: 8
  end

  add_index "pooldata", ["replication_val"], name: "pooldata_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "ports", id: false, force: true do |t|
    t.text    "comport"
    t.text    "devicename"
    t.integer "devicetype", limit: 2
    t.integer "baud",       limit: 2
    t.integer "bytesize",   limit: 2
    t.integer "stopbits",   limit: 2
    t.integer "parity",     limit: 2
    t.integer "rit",        limit: 2
    t.integer "rttc",       limit: 2
    t.integer "rttm",       limit: 2
    t.integer "wttc",       limit: 2
    t.integer "wttm",       limit: 2
    t.integer "isactive",   limit: 2, default: 1
    t.text    "mycommand"
    t.integer "autoreset",  limit: 2, default: 0
  end

  create_table "prefs", primary_key: "username", force: true do |t|
    t.integer  "inactive",          limit: 2, default: 0
    t.integer  "admin",             limit: 2, default: 0
    t.integer  "usertype",          limit: 2
    t.integer  "reusebarcode",      limit: 2, default: 1
    t.integer  "noscale",           limit: 2, default: 1
    t.text     "locations"
    t.text     "permissions"
    t.integer  "hourly",            limit: 2, default: 0
    t.text     "userfullname"
    t.text     "password"
    t.text     "idnum"
    t.text     "sig"
    t.text     "employeelocations"
    t.text     "qblistid"
    t.text     "qbresponse"
    t.datetime "created",                     default: "now()"
    t.datetime "modified"
    t.text     "pin"
    t.integer  "replication_val",   limit: 8
  end

  add_index "prefs", ["replication_val"], name: "prefs_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "preordersales", force: true do |t|
    t.integer "ticketid",        limit: 8
    t.text    "customerid"
    t.integer "sessiontime",     limit: 8
    t.integer "deleted",         limit: 2, default: 0
    t.integer "completed",       limit: 2, default: 0
    t.decimal "quantity"
    t.integer "productid",       limit: 8
    t.integer "status",          limit: 2, default: 0
    t.integer "location",        limit: 8
    t.integer "verified",        limit: 2, default: 0
    t.integer "replication_val", limit: 8
    t.integer "newcustomer",     limit: 2
  end

  add_index "preordersales", ["replication_val"], name: "preordersales_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "preordertickets", force: true do |t|
    t.text    "customerid"
    t.text    "kushid"
    t.integer "sessiontime",     limit: 8
    t.integer "deleted",         limit: 2, default: 0
    t.integer "completed",       limit: 2, default: 0
    t.text    "lastname"
    t.text    "firstname"
    t.integer "status",          limit: 2, default: 0
    t.integer "birthmonth",      limit: 2
    t.integer "birthday",        limit: 2
    t.integer "birthyear"
    t.integer "location",        limit: 8
    t.integer "orderid",         limit: 8
    t.decimal "total"
    t.integer "newcustomer",     limit: 2
    t.text    "batchdata"
    t.decimal "actualtotal"
    t.text    "salesdata"
    t.integer "verified",        limit: 2, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "preordertickets", ["replication_val"], name: "preordertickets_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "prescriptions", force: true do |t|
    t.string  "customerid",        limit: 10
    t.text    "medname"
    t.decimal "medquantity"
    t.text    "medquantity_units"
    t.text    "frequency1"
    t.text    "frequency2"
    t.text    "everynum1"
    t.text    "everynum2"
    t.integer "everyqualifier",    limit: 2
    t.integer "refills",           limit: 2
    t.integer "datetime",          limit: 8
    t.integer "deleted",           limit: 2,  default: 0
    t.text    "tab"
    t.text    "sig"
    t.text    "fullsig"
    t.integer "doctorid",          limit: 8
    t.integer "providerid",        limit: 8
    t.text    "icd_code"
    t.text    "icd_description"
    t.text    "instruction"
    t.integer "location",          limit: 8
    t.integer "rxdate",            limit: 8
    t.integer "replication_val",   limit: 8
    t.integer "days_supply"
  end

  add_index "prescriptions", ["replication_val"], name: "prescriptions_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "printers", id: false, force: true do |t|
    t.text    "devicename"
    t.text    "printername"
    t.integer "assist",      limit: 2, default: 0
    t.integer "orientation", limit: 2, default: 0
  end

  create_table "product_matching", force: true do |t|
    t.integer "myorder",          limit: 2
    t.integer "active",           limit: 2, default: 0
    t.text    "type_name"
    t.text    "type_description"
    t.integer "approx",           limit: 2, default: 0
    t.integer "replication_val",  limit: 8
  end

  add_index "product_matching", ["replication_val"], name: "product_matching_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "productcategories", force: true do |t|
    t.text     "name"
    t.integer  "location",                limit: 8, default: 1
    t.integer  "deleted",                 limit: 2, default: 0
    t.text     "pricepoint"
    t.integer  "kushit",                  limit: 2
    t.integer  "noinventoryroom",         limit: 2
    t.datetime "created",                           default: "now()"
    t.datetime "modified"
    t.integer  "replication_val",         limit: 8
    t.decimal  "desiredamtavailable"
    t.decimal  "desiredreorderpt"
    t.integer  "desiredreorderpt_ignore", limit: 2
  end

  add_index "productcategories", ["replication_val"], name: "productcategories_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "productcategorieslog", primary_key: "logid", force: true do |t|
    t.integer "id",              limit: 8
    t.text    "name"
    t.integer "location",        limit: 8, default: 1
    t.integer "deleted",         limit: 2, default: 0
    t.text    "pricepoint"
    t.integer "sessiontime",     limit: 8
    t.text    "lastuser"
    t.integer "lastaction"
    t.integer "noinventoryroom", limit: 2
    t.integer "replication_val", limit: 8
  end

  add_index "productcategorieslog", ["replication_val"], name: "productcategorieslog_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "products", force: true do |t|
    t.text     "name"
    t.integer  "taxcategory",             limit: 8, default: 9
    t.integer  "productcategory",         limit: 8
    t.integer  "applymemberdiscount",     limit: 2, default: 0
    t.text     "strain"
    t.text     "pricepoint"
    t.text     "image"
    t.integer  "location",                limit: 8, default: 1
    t.integer  "ismedicated",             limit: 2, default: 1
    t.integer  "requiresweighing",        limit: 2, default: 1
    t.integer  "requiresinventory",       limit: 2, default: 1
    t.integer  "deleted",                 limit: 2, default: 0
    t.text     "externalbarcode"
    t.text     "productdescription"
    t.text     "qblistid"
    t.text     "qbresponse"
    t.integer  "inventorytype",           limit: 2, default: -1
    t.datetime "created",                           default: "now()"
    t.datetime "modified"
    t.decimal  "defaultusable"
    t.integer  "defaultvendor",           limit: 8
    t.decimal  "costperunit"
    t.text     "sharedcategories"
    t.integer  "ismembersonly",           limit: 2
    t.integer  "kushit",                  limit: 2
    t.integer  "prepack",                 limit: 2
    t.integer  "mitsweighable",           limit: 2
    t.text     "ndc"
    t.integer  "replication_val",         limit: 8
    t.text     "days_supply"
    t.integer  "taxcategory_alternate",   limit: 2
    t.text     "pricepoint_alternate"
    t.decimal  "desiredamtavailable"
    t.decimal  "desiredreorderpt"
    t.integer  "desiredreorderpt_ignore", limit: 2
  end

  add_index "products", ["replication_val"], name: "products_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "products_nonregulated", force: true do |t|
    t.text     "name"
    t.integer  "taxcategory",         limit: 8
    t.integer  "productcategory",     limit: 8
    t.integer  "applymemberdiscount", limit: 2, default: 0
    t.text     "strain"
    t.text     "pricepoint"
    t.text     "image"
    t.integer  "location",            limit: 8, default: 1
    t.integer  "ismedicated",         limit: 2, default: 1
    t.integer  "requiresweighing",    limit: 2, default: 1
    t.integer  "requiresinventory",   limit: 2, default: 1
    t.integer  "deleted",             limit: 2, default: 0
    t.text     "externalbarcode"
    t.text     "productdescription"
    t.text     "qblistid"
    t.text     "qbresponse"
    t.integer  "inventorytype",       limit: 2, default: -1
    t.datetime "created",                       default: "now()"
    t.datetime "modified"
    t.decimal  "defaultusable"
    t.integer  "defaultvendor",       limit: 8
    t.decimal  "costperunit"
    t.text     "sharedcategories"
    t.integer  "ismembersonly",       limit: 2, default: 0
  end

  add_index "products_nonregulated", ["qblistid"], name: "products_nonregulated_qblistid_key", unique: true, using: :btree

  create_table "productslog", primary_key: "logid", force: true do |t|
    t.integer "id",                  limit: 8
    t.text    "name"
    t.integer "taxcategory",         limit: 8
    t.integer "productcategory",     limit: 8
    t.integer "applymemberdiscount", limit: 2, default: 0
    t.text    "strain"
    t.text    "pricepoint"
    t.integer "location",            limit: 8, default: 1
    t.integer "ismedicated",         limit: 2, default: 1
    t.integer "requiresweighing",    limit: 2, default: 1
    t.integer "requiresinventory",   limit: 2, default: 1
    t.integer "deleted",             limit: 2, default: 0
    t.text    "externalbarcode"
    t.text    "productdescription"
    t.integer "inventorytype",       limit: 2, default: -1
    t.decimal "defaultusable"
    t.integer "defaultvendor",       limit: 8
    t.decimal "costperunit"
    t.text    "sharedcategories"
    t.integer "sessiontime",         limit: 8
    t.text    "lastuser"
    t.integer "lastaction"
    t.integer "mitsweighable",       limit: 2
    t.integer "replication_val",     limit: 8
    t.text    "ndc"
    t.text    "days_supply"
  end

  add_index "productslog", ["replication_val"], name: "productslog_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "providers", force: true do |t|
    t.text    "first"
    t.text    "last"
    t.text    "middle"
    t.text    "address1"
    t.text    "address2"
    t.text    "city"
    t.string  "state",           limit: 2
    t.string  "zip",             limit: 10
    t.text    "title"
    t.text    "phone"
    t.text    "fax"
    t.text    "dea"
    t.integer "inactive",        limit: 2,  default: 0
    t.integer "pid",             limit: 8,  default: "nextval('providers_pid_seq'::regclass)", null: false
    t.integer "interval",        limit: 2,  default: 15
    t.text    "lunch"
    t.text    "workweek"
    t.text    "stime"
    t.text    "etime"
    t.integer "deleted",         limit: 2,  default: 0
    t.integer "location",        limit: 2,  default: 1
    t.integer "replication_val", limit: 8
  end

  add_index "providers", ["replication_val"], name: "providers_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "proxy", primary_key: "hostname", force: true do |t|
    t.integer "port"
    t.text    "username"
    t.text    "password"
    t.integer "ssl",             limit: 2
    t.integer "lastused",        limit: 2
    t.integer "replication_val", limit: 8
  end

  add_index "proxy", ["replication_val"], name: "proxy_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "qb_account_name_settings", force: true do |t|
    t.text    "account_name"
    t.text    "account_type"
    t.integer "replication_val", limit: 8
  end

  add_index "qb_account_name_settings", ["replication_val"], name: "qb_account_name_settings_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "quickbooks", id: false, force: true do |t|
    t.text "entity", null: false
    t.text "key",    null: false
    t.text "value"
  end

  create_table "receiptcustomization", force: true do |t|
    t.integer "fontsize",        limit: 2
    t.integer "xoffset"
    t.integer "yoffset"
    t.integer "centeroffset"
    t.integer "xlimit"
    t.integer "column2"
    t.integer "column3"
    t.decimal "multiplier"
    t.integer "textwrap"
    t.text    "textaddendum"
    t.integer "autoprint",       limit: 2, default: 1
    t.integer "copies",          limit: 2, default: 1
    t.integer "signature",       limit: 2, default: 0
    t.integer "customername",    limit: 2, default: 0
    t.integer "charlimit",       limit: 2
    t.integer "dot",             limit: 2, default: 1
    t.decimal "maxqty"
    t.integer "charwrap",        limit: 2, default: 0
    t.integer "logooffset"
    t.integer "employee",        limit: 2, default: 0
    t.integer "replication_val", limit: 8
    t.integer "customeraddress", limit: 2, default: 0
  end

  add_index "receiptcustomization", ["replication_val"], name: "receiptcustomization_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "recommendationmessages", force: true do |t|
    t.text    "message"
    t.integer "replication_val", limit: 8
  end

  add_index "recommendationmessages", ["replication_val"], name: "recommendationmessages_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "recommendations", force: true do |t|
    t.text    "diagnosis"
    t.text    "letter"
    t.string  "customerid",             limit: 10
    t.integer "sessiontime",            limit: 8
    t.string  "providerid",             limit: 32
    t.integer "transactionid",          limit: 8
    t.integer "totaltime",              limit: 8
    t.integer "transactionid_original", limit: 8
    t.integer "replication_val",        limit: 8
  end

  add_index "recommendations", ["replication_val"], name: "recommendations_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "referralmethods", force: true do |t|
    t.text    "name"
    t.integer "deleted",         limit: 2, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "referralmethods", ["replication_val"], name: "referralmethods_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "refreshrate", force: true do |t|
    t.decimal "rate",                         default: 0.0
    t.integer "timeout",            limit: 8, default: 3600
    t.integer "location",           limit: 8, default: 1
    t.integer "keepalive",          limit: 2, default: 1
    t.integer "keepalivetime",                default: 300
    t.integer "growhouse",          limit: 2, default: 1
    t.integer "currentinventory",   limit: 2, default: 1
    t.integer "dispensedinventory", limit: 2, default: 0
    t.integer "sales",              limit: 2, default: 1
    t.integer "transfers",          limit: 2, default: 0
    t.integer "accounts",           limit: 2, default: 0
    t.integer "appointments",       limit: 2, default: 0
    t.integer "payouts",            limit: 2, default: 0
    t.integer "messages",           limit: 2, default: 1
    t.integer "timeclock",          limit: 2, default: 1
    t.integer "products",           limit: 2, default: 1
    t.integer "productcategories",  limit: 2, default: 1
    t.integer "manifests",          limit: 2, default: 0
    t.integer "qa",                 limit: 2, default: 0
    t.integer "replication_val",    limit: 8
  end

  add_index "refreshrate", ["replication_val"], name: "refreshrate_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "rep_categories", primary_key: "categoryid", force: true do |t|
    t.text    "name"
    t.text    "description"
    t.text    "catstate_only"
    t.integer "replication_val", limit: 8
  end

  add_index "rep_categories", ["replication_val"], name: "rep_categories_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "rep_mobileparameters", primary_key: "paramid", force: true do |t|
    t.integer "reportid",        limit: 8
    t.text    "name"
    t.text    "data"
    t.text    "ptype"
    t.integer "replication_val", limit: 8
  end

  add_index "rep_mobileparameters", ["replication_val"], name: "rep_mobileparameters_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "rep_mobilereports", primary_key: "reportid", force: true do |t|
    t.text    "name"
    t.integer "paginate",        limit: 2, default: 0
    t.text    "code"
    t.integer "replication_val", limit: 8
  end

  add_index "rep_mobilereports", ["replication_val"], name: "rep_mobilereports_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "rep_parameters", primary_key: "paramid", force: true do |t|
    t.integer "reportid",                   null: false
    t.string  "name",            limit: 64, null: false
    t.string  "type",            limit: 16
    t.text    "initial"
    t.text    "defaultval"
    t.text    "data"
    t.string  "label",           limit: 64
    t.string  "tip",             limit: 64
    t.integer "flags"
    t.text    "sumcolumns"
    t.integer "replication_val", limit: 8
  end

  add_index "rep_parameters", ["replication_val"], name: "rep_parameters_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "rep_preferencesorder", force: true do |t|
    t.text    "reportname"
    t.text    "colname"
    t.integer "colnumber",       limit: 8
    t.integer "replication_val", limit: 8
  end

  add_index "rep_preferencesorder", ["replication_val"], name: "rep_preferencesorder_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "rep_preferencesremoved", force: true do |t|
    t.text    "reportname"
    t.text    "colname"
    t.integer "replication_val", limit: 8
  end

  add_index "rep_preferencesremoved", ["replication_val"], name: "rep_preferencesremoved_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "rep_reports", primary_key: "reportid", force: true do |t|
    t.integer "categoryid"
    t.text    "name"
    t.text    "title"
    t.text    "description"
    t.text    "code"
    t.integer "admin",           limit: 2, default: 1
    t.integer "favorite",        limit: 2, default: 0
    t.text    "repstate_only"
    t.integer "replication_val", limit: 8
  end

  add_index "rep_reports", ["replication_val"], name: "rep_reports_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "repl_tables", force: true do |t|
    t.text "tablename"
    t.text "tablekey"
  end

  create_table "replication_history", force: true do |t|
    t.text     "tabname"
    t.text     "operation"
    t.hstore   "new_val"
    t.hstore   "primary_val"
    t.integer  "replication_val", limit: 8
    t.datetime "ts",                        default: "now()"
    t.text     "repl_user"
  end

  create_table "reportsubmissions", force: true do |t|
    t.integer "sessiontime",            limit: 8
    t.integer "location",               limit: 8
    t.text    "month"
    t.text    "year"
    t.integer "time_start",             limit: 8
    t.integer "time_end",               limit: 8
    t.decimal "gross_sales"
    t.decimal "excise_tax"
    t.decimal "amount_due"
    t.integer "deleted",                limit: 2, default: 0
    t.integer "submit_time",            limit: 8
    t.integer "re_submit_time",         limit: 8
    t.integer "transactionid",          limit: 8
    t.integer "transactionid_original", limit: 8
    t.integer "replication_val",        limit: 8
  end

  add_index "reportsubmissions", ["replication_val"], name: "reportsubmissions_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "roomcolors", force: true do |t|
    t.text    "color"
    t.integer "replication_val", limit: 8
  end

  add_index "roomcolors", ["replication_val"], name: "roomcolors_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "rooms", force: true do |t|
    t.text    "roomname"
    t.integer "location",               limit: 8, default: 1
    t.integer "gridx",                  limit: 2
    t.integer "gridy",                  limit: 2
    t.integer "width"
    t.integer "height"
    t.integer "phase",                  limit: 2
    t.integer "deleted",                limit: 2, default: 0
    t.text    "color"
    t.integer "transactionid",          limit: 8
    t.integer "transactionid_original", limit: 8
    t.integer "replication_val",        limit: 8
  end

  add_index "rooms", ["replication_val"], name: "rooms_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "sales", force: true do |t|
    t.string  "ticketid",               limit: 16
    t.text    "strain"
    t.decimal "price",                             default: 0.0
    t.decimal "tax",                               default: 0.0
    t.decimal "total",                             default: 0.0
    t.integer "weighheavy",             limit: 2
    t.integer "manualweigh",            limit: 2
    t.text    "pricepoint"
    t.text    "cumulativepricepoint"
    t.integer "location",               limit: 8,  default: 1
    t.integer "productid",              limit: 8
    t.string  "customerid",             limit: 10
    t.decimal "weight",                            default: 0.0
    t.integer "datetime",               limit: 8
    t.text    "inventoryid"
    t.integer "ismedicated",            limit: 2,  default: 0
    t.integer "requiresweighing",       limit: 2,  default: 1
    t.integer "deleted",                limit: 2,  default: 0
    t.integer "refunded",               limit: 2,  default: 0
    t.string  "refticketid",            limit: 16
    t.decimal "usableweight"
    t.integer "restocked",              limit: 2,  default: 0
    t.decimal "heavyweight"
    t.integer "taxcat"
    t.integer "grade",                  limit: 8
    t.integer "terminalid",             limit: 8
    t.integer "returnsaleid",           limit: 8
    t.integer "returntime",             limit: 8
    t.integer "itemnumber"
    t.decimal "price_post_discount"
    t.integer "transactionid",          limit: 8
    t.integer "transactionid_original", limit: 8
    t.integer "replication_val",        limit: 8
    t.text    "terminaluid"
  end

  add_index "sales", ["replication_val"], name: "sales_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "salesinventory", force: true do |t|
    t.integer "saleid",          limit: 8
    t.text    "inventoryid"
    t.decimal "quantity"
    t.decimal "price"
    t.integer "deleted",         limit: 2, default: 0
    t.decimal "weight"
    t.integer "room",            limit: 8
    t.text    "secondaryid"
    t.integer "sessiontime",     limit: 8
    t.integer "replication_val", limit: 8
  end

  add_index "salesinventory", ["replication_val"], name: "salesinventory_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "saleslimits", force: true do |t|
    t.integer "enabled",         limit: 2, default: 1
    t.integer "hourmin",         limit: 2, default: 8
    t.integer "hourmax",         limit: 2, default: 19
    t.decimal "limitnum",                  default: 0.0
    t.integer "limittype",       limit: 2, default: 0
    t.integer "limitdays",       limit: 2, default: 1
    t.decimal "limitreal"
    t.integer "minmin",          limit: 2, default: 0
    t.integer "minmax",          limit: 2, default: 0
    t.integer "saleaction",      limit: 2, default: 0
    t.integer "limitaction",     limit: 2, default: 0
    t.integer "expireaction",    limit: 2, default: 0
    t.integer "limitdisallow",   limit: 2, default: 0
    t.integer "limitdoctor",     limit: 2, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "saleslimits", ["replication_val"], name: "saleslimits_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "saleslimits_wa", force: true do |t|
    t.integer "inventorytype",   limit: 2
    t.decimal "limitnum"
    t.integer "limittype",       limit: 2, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "saleslimits_wa", ["replication_val"], name: "saleslimits_wa_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "salesoptions", force: true do |t|
    t.integer "allownegative",         limit: 2, default: 0
    t.integer "outofstock",            limit: 2, default: 1
    t.integer "sharebatch",            limit: 2, default: 1
    t.text    "country"
    t.text    "state"
    t.integer "requirediscountreason", limit: 2, default: 0
    t.integer "ticketprotection",      limit: 2, default: 0
    t.integer "replication_val",       limit: 8
  end

  add_index "salesoptions", ["replication_val"], name: "salesoptions_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "savedqueries", force: true do |t|
    t.text    "queryname"
    t.text    "querydata"
    t.integer "replication_val", limit: 8
  end

  add_index "savedqueries", ["replication_val"], name: "savedqueries_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "scale", id: false, force: true do |t|
    t.integer "usescale",      limit: 2, default: 1
    t.integer "grammode",      limit: 2, default: 1
    t.integer "fullemulation", limit: 2, default: 1
  end

  create_table "scaleresolution", force: true do |t|
    t.text    "grams"
    t.text    "ounces"
    t.integer "replication_val", limit: 8
  end

  add_index "scaleresolution", ["replication_val"], name: "scaleresolution_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "scanner", id: false, force: true do |t|
    t.integer "autocrop",             limit: 2
    t.integer "compression",          limit: 2
    t.integer "dpi"
    t.integer "colorcorrect",         limit: 2, default: -1
    t.integer "manualcrop",           limit: 2, default: 0
    t.text    "manualcropdimensions"
  end

  create_table "shared_printers", force: true do |t|
    t.integer "terminal_id",     limit: 8
    t.integer "location__id",    limit: 8
    t.text    "printer_name"
    t.integer "replication_val", limit: 8
  end

  add_index "shared_printers", ["replication_val"], name: "shared_printers_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "shared_printers_queue", force: true do |t|
    t.integer "shared_printers__id", limit: 8
    t.text    "caller"
    t.text    "print"
    t.integer "replication_val",     limit: 8
  end

  add_index "shared_printers_queue", ["replication_val"], name: "shared_printers_queue_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "shareddatabase", force: true do |t|
    t.text    "hostname"
    t.integer "port"
    t.integer "ssl",             limit: 2
    t.integer "lastused",        limit: 2
    t.text    "name"
    t.integer "lastusedtime",    limit: 8, default: 0
    t.text    "database_oid"
    t.integer "replication_val", limit: 8
  end

  add_index "shareddatabase", ["replication_val"], name: "shareddatabase_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "shipvia", id: false, force: true do |t|
    t.integer "id",              default: "nextval('shipvia_id_seq'::regclass)", null: false
    t.string  "name", limit: 20,                                                 null: false
  end

  create_table "smscarriers", force: true do |t|
    t.text    "carriername"
    t.text    "carriersuffix"
    t.integer "replication_val", limit: 8
  end

  add_index "smscarriers", ["replication_val"], name: "smscarriers_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "smssettings", force: true do |t|
    t.text    "smsnumber"
    t.text    "smssuffix"
    t.text    "smscarrier"
    t.integer "smschoice"
    t.integer "replication_val", limit: 8
  end

  add_index "smssettings", ["replication_val"], name: "smssettings_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "smtpsettings", force: true do |t|
    t.text    "email"
    t.text    "password"
    t.text    "smtpaddress"
    t.integer "smtpport"
    t.integer "smtpssl",         limit: 2, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "smtpsettings", ["replication_val"], name: "smtpsettings_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "state_zip_code_list", force: true do |t|
    t.text "zip"
    t.text "type"
    t.text "primary_city"
    t.text "acceptable_cities"
    t.text "unacceptable_cities"
    t.text "state"
    t.text "county"
    t.text "timezone"
    t.text "area_codes"
    t.text "latitude"
    t.text "longitude"
    t.text "world_region"
    t.text "country"
    t.text "decommissioned"
    t.text "estimated_population"
    t.text "notes"
  end

  create_table "statemonitorsettings", force: true do |t|
    t.integer "enabled",             limit: 2, default: 0
    t.integer "confirm",             limit: 2, default: 0
    t.integer "details",             limit: 2, default: 0
    t.text    "username"
    t.text    "password"
    t.text    "ubi"
    t.text    "hostname"
    t.integer "confirm_return",      limit: 2, default: 0
    t.integer "sync_type",           limit: 2, default: 0
    t.integer "replication_val",     limit: 8
    t.integer "retry_count",         limit: 2, default: 10
    t.integer "zero_sum",            limit: 2, default: 0
    t.integer "last_password_reset", limit: 8
    t.integer "timeout",             limit: 8, default: 120
    t.integer "autocorrect",         limit: 2, default: 1
  end

  add_index "statemonitorsettings", ["replication_val"], name: "statemonitorsettings_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "strainnotes", force: true do |t|
    t.text    "userid"
    t.integer "sessiontime",     limit: 8
    t.text    "subject"
    t.text    "note"
    t.integer "strainid",        limit: 8
    t.integer "deleted",         limit: 2, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "strainnotes", ["replication_val"], name: "strainnotes_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "strains", force: true do |t|
    t.text    "strainname"
    t.text    "straintype"
    t.text    "strainimage"
    t.text    "growthphases"
    t.text    "dryphases"
    t.integer "location",        limit: 8, default: 1
    t.integer "deleted",         limit: 2, default: 0
    t.text    "color"
    t.integer "replication_val", limit: 8
    t.integer "quality"
  end

  add_index "strains", ["replication_val"], name: "strains_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "strainslog", primary_key: "logid", force: true do |t|
    t.integer "id",              limit: 8
    t.text    "name"
    t.integer "location",        limit: 8, default: 1
    t.integer "deleted",         limit: 2, default: 0
    t.text    "straintype"
    t.integer "sessiontime",     limit: 8
    t.text    "lastuser"
    t.integer "lastaction"
    t.integer "replication_val", limit: 8
  end

  add_index "strainslog", ["replication_val"], name: "strainslog_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "straintypes", force: true do |t|
    t.text    "name"
    t.integer "deleted",         limit: 2, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "straintypes", ["replication_val"], name: "straintypes_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "sync_attempts", force: true do |t|
    t.integer "my_time", limit: 8
  end

  create_table "sync_lock", force: true do |t|
  end

  create_table "sync_status", force: true do |t|
    t.integer "sessiontime",       limit: 8
    t.integer "success",           limit: 2
    t.integer "failure",           limit: 2
    t.integer "replication_val",   limit: 8
    t.integer "real_session_time", limit: 8
    t.integer "zero_sum",          limit: 2, default: 0
  end

  add_index "sync_status", ["replication_val"], name: "sync_status_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "systemauthorization", force: true do |t|
    t.integer "perterminal",       limit: 2, default: 0
    t.integer "pinauthorize",      limit: 2, default: 0
    t.integer "adminpinauthorize", limit: 2, default: 0
    t.integer "replication_val",   limit: 8
  end

  add_index "systemauthorization", ["replication_val"], name: "systemauthorization_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "taborder", force: true do |t|
    t.text    "tabname"
    t.integer "taborder",        limit: 2
    t.integer "replication_val", limit: 8
  end

  add_index "taborder", ["replication_val"], name: "taborder_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "taskqueue", force: true do |t|
    t.integer "priority",        limit: 2, default: 0
    t.integer "finished",        limit: 2, default: 0
    t.integer "sessiontime",     limit: 8
    t.text    "queuetype"
    t.text    "queuedata"
    t.text    "results"
    t.integer "replication_val", limit: 8
  end

  add_index "taskqueue", ["replication_val"], name: "taskqueue_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "tasks", force: true do |t|
    t.text    "name"
    t.integer "interval",        limit: 8
    t.integer "mytime",          limit: 8
    t.integer "taskpriority",    limit: 2, default: 0
    t.integer "isactive",        limit: 2, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "tasks", ["replication_val"], name: "tasks_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "taxbreakdowns", force: true do |t|
    t.text    "name"
    t.integer "deleted",         limit: 2, default: 0
    t.text    "defaultval"
    t.integer "replication_val", limit: 8
  end

  add_index "taxbreakdowns", ["replication_val"], name: "taxbreakdowns_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "taxcategories", force: true do |t|
    t.text    "name"
    t.decimal "rate",                      default: 0.0
    t.integer "location",        limit: 8, default: 1
    t.integer "deleted",         limit: 2, default: 0
    t.decimal "fee",                       default: 0.0
    t.integer "kushit",          limit: 2
    t.text    "breakdown"
    t.integer "replication_val", limit: 8
  end

  add_index "taxcategories", ["replication_val"], name: "taxcategories_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "taxcategories_log", primary_key: "logid", force: true do |t|
    t.integer "id",              limit: 8
    t.text    "name"
    t.decimal "rate"
    t.integer "deleted",         limit: 2
    t.decimal "fee"
    t.integer "kushit",          limit: 2
    t.text    "breakdown"
    t.integer "sessiontime",     limit: 8
    t.integer "replication_val", limit: 8
  end

  add_index "taxcategories_log", ["replication_val"], name: "taxcategories_log_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "taxdiscounts", force: true do |t|
    t.integer "enabled",         limit: 2, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "taxdiscounts", ["replication_val"], name: "taxdiscounts_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "tc_punches", primary_key: "punchid", force: true do |t|
    t.integer "punchin"
    t.integer "punchout"
    t.string  "username",        limit: 64
    t.integer "location",        limit: 2,  default: 1
    t.integer "manual",          limit: 2,  default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "tc_punches", ["replication_val"], name: "tc_punches_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "tc_punches_log", force: true do |t|
    t.integer  "punchid",         limit: 8
    t.integer  "punchin",         limit: 8
    t.integer  "punchout",        limit: 8
    t.text     "username"
    t.integer  "location",        limit: 8
    t.integer  "instype",         limit: 2
    t.datetime "datetime",                  default: "now()"
    t.integer  "manual",          limit: 2
    t.text     "modifyuser"
    t.integer  "replication_val", limit: 8
  end

  add_index "tc_punches_log", ["replication_val"], name: "tc_punches_log_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "tempreadings", force: true do |t|
    t.integer "tempunits",       limit: 2, default: 2
    t.float   "temperature"
    t.float   "humidity"
    t.float   "dewpoint"
    t.integer "sessiontime",     limit: 8
    t.integer "replication_val", limit: 8
  end

  add_index "tempreadings", ["replication_val"], name: "tempreadings_replication_idx", where: "(replication_val > 0)", using: :btree
  add_index "tempreadings", ["sessiontime"], name: "tempreadings_sessiontime", using: :btree

  create_table "tempsettings", force: true do |t|
    t.integer "tempunits",       limit: 2, default: 2
    t.integer "tempwarnlow",     limit: 2
    t.integer "tempwarnhi",      limit: 2
    t.integer "humidwarnlow",    limit: 2
    t.integer "humidwarnhi",     limit: 2
    t.integer "sendsms",         limit: 2, default: 1
    t.integer "tempfrequency",             default: 10
    t.integer "replication_val", limit: 8
  end

  add_index "tempsettings", ["replication_val"], name: "tempsettings_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "terminalcash", force: true do |t|
    t.decimal "amount"
    t.integer "sessiontime",     limit: 8
    t.text    "userid"
    t.integer "terminalid",      limit: 8
    t.integer "cashcloseid",     limit: 8
    t.integer "replication_val", limit: 8
  end

  add_index "terminalcash", ["replication_val"], name: "terminalcash_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "terminals", force: true do |t|
    t.text    "terminaluuid"
    t.integer "location",        limit: 2, default: 1
    t.text    "terminalname"
    t.decimal "cashonhand",                default: 0.0
    t.integer "deleted",         limit: 2, default: 0
    t.integer "auth",            limit: 2, default: 0
    t.integer "defaultroom",     limit: 8
    t.integer "lastseen",        limit: 8
    t.text    "last_user"
    t.integer "replication_val", limit: 8
    t.integer "kiosk",           limit: 2
  end

  add_index "terminals", ["replication_val"], name: "terminals_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "things", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", primary_key: "ticketserial", force: true do |t|
    t.string   "id",                     limit: 16
    t.decimal  "price",                             default: 0.0
    t.decimal  "tax",                               default: 0.0
    t.decimal  "totalprice",                        default: 0.0
    t.integer  "terminal",               limit: 8
    t.text     "userid"
    t.integer  "datetime",               limit: 8
    t.integer  "location",               limit: 8,  default: 1
    t.string   "customerid",             limit: 10
    t.integer  "transactionid",          limit: 8
    t.decimal  "tendered"
    t.decimal  "change"
    t.integer  "deleted",                limit: 2,  default: 0
    t.decimal  "refundprice",                       default: 0.0
    t.decimal  "refundtax",                         default: 0.0
    t.decimal  "refundtotalprice",                  default: 0.0
    t.string   "refticketid",            limit: 16
    t.text     "voidedby"
    t.text     "qbtxnid"
    t.text     "qbresponse"
    t.datetime "created",                           default: "now()"
    t.datetime "modified"
    t.text     "voidreason"
    t.integer  "taxexempt",              limit: 2,  default: 0
    t.decimal  "ticketpoints"
    t.integer  "fallback",               limit: 2
    t.integer  "pif",                    limit: 2,  default: 1
    t.integer  "preorder",               limit: 2,  default: 0
    t.decimal  "referralpoints"
    t.integer  "shipdate",               limit: 8
    t.text     "shipcustomer"
    t.integer  "transactionid_original", limit: 8
    t.integer  "replication_val",        limit: 8
  end

  add_index "tickets", ["replication_val"], name: "tickets_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "touchscreen", force: true do |t|
    t.integer "enabled",         limit: 2, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "touchscreen", ["replication_val"], name: "touchscreen_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "vehicles", force: true do |t|
    t.text    "name"
    t.text    "make"
    t.text    "model"
    t.text    "plate"
    t.integer "deleted",                limit: 2, default: 0
    t.text    "vin"
    t.text    "color"
    t.text    "year"
    t.integer "transactionid",          limit: 8
    t.integer "transactionid_original", limit: 8
    t.integer "replication_val",        limit: 8
  end

  add_index "vehicles", ["replication_val"], name: "vehicles_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "vehicles_vendors", force: true do |t|
    t.text    "name"
    t.text    "make"
    t.text    "model"
    t.text    "plate"
    t.integer "deleted",                limit: 2, default: 0
    t.text    "vin"
    t.text    "color"
    t.text    "year"
    t.integer "transactionid",          limit: 8
    t.integer "transactionid_original", limit: 8
    t.text    "vendor_ubi"
    t.text    "vendor_license"
    t.integer "vendor_type",            limit: 2
    t.integer "replication_val",        limit: 8
  end

  add_index "vehicles_vendors", ["replication_val"], name: "vehicles_vendors_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "vendordocumentcategories", force: true do |t|
    t.text    "name"
    t.integer "deleted",         limit: 2, default: 0
    t.integer "location",        limit: 2, default: 1
    t.integer "replication_val", limit: 8
  end

  add_index "vendordocumentcategories", ["replication_val"], name: "vendordocumentcategories_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "vendordocuments", primary_key: "docid", force: true do |t|
    t.text    "docname"
    t.text    "docdata"
    t.text    "customerid"
    t.integer "datetime",        limit: 8
    t.integer "deleted",         limit: 2, default: 0
    t.integer "doccategory",     limit: 2
    t.integer "rotate",          limit: 2
    t.integer "replication_val", limit: 8
  end

  add_index "vendordocuments", ["customerid"], name: "vendordocuments_customerid", using: :btree
  add_index "vendordocuments", ["deleted"], name: "vendordocuments_deleted", using: :btree
  add_index "vendordocuments", ["replication_val"], name: "vendordocuments_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "vendors", force: true do |t|
    t.text     "name"
    t.text     "address1"
    t.text     "address2"
    t.text     "city"
    t.string   "state",                        limit: 2
    t.string   "zip",                          limit: 9
    t.text     "phone"
    t.integer  "deleted",                      limit: 2, default: 0
    t.text     "licensenum"
    t.text     "qblistid"
    t.text     "qbresponse"
    t.datetime "created",                                default: "now()"
    t.datetime "modified"
    t.text     "fax"
    t.integer  "mip",                          limit: 2, default: 0
    t.text     "email"
    t.text     "website"
    t.text     "description"
    t.text     "contact"
    t.text     "customerid"
    t.integer  "producer",                     limit: 2, default: 0
    t.integer  "processor",                    limit: 2, default: 0
    t.integer  "retail",                       limit: 2, default: 0
    t.integer  "locationtype",                 limit: 2
    t.text     "ubi"
    t.integer  "replication_val",              limit: 8
    t.integer  "is_acctingsupplier",           limit: 2, default: 0
    t.integer  "accting_invoices_customer_id",           default: "nextval('customers_accting_invoices_customer_id_seq'::regclass)", null: false
  end

  add_index "vendors", ["replication_val"], name: "vendors_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "vendors_temp", force: true do |t|
    t.text     "name"
    t.text     "address1"
    t.text     "address2"
    t.text     "city"
    t.text     "state"
    t.text     "zip"
    t.text     "phone"
    t.integer  "deleted",                limit: 2, default: 0
    t.text     "licensenum"
    t.text     "qblistid"
    t.text     "qbresponse"
    t.datetime "created",                          default: "now()"
    t.datetime "modified"
    t.text     "fax"
    t.integer  "mip",                    limit: 2, default: 0
    t.text     "email"
    t.text     "website"
    t.text     "description"
    t.text     "contact"
    t.text     "customerid"
    t.text     "licensetypecode"
    t.integer  "producer",               limit: 2, default: 0
    t.integer  "processor",              limit: 2, default: 0
    t.integer  "retail",                 limit: 2, default: 0
    t.integer  "locationtype",           limit: 2, default: 0
    t.text     "ubi"
    t.integer  "transactionid",          limit: 8
    t.integer  "transactionid_original", limit: 8
    t.integer  "replication_val",        limit: 8
  end

  add_index "vendors_temp", ["replication_val"], name: "vendors_temp_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "version", primary_key: "versionnum", force: true do |t|
    t.integer "replication_val", limit: 8
  end

  add_index "version", ["replication_val"], name: "version_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "versionhistory", force: true do |t|
    t.text    "myversion"
    t.text    "mychanges"
    t.integer "viewed",          limit: 2, default: 0
    t.text    "statespecific"
    t.integer "replication_val", limit: 8
  end

  add_index "versionhistory", ["replication_val"], name: "versionhistory_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "waste", force: true do |t|
    t.decimal "weight",                    default: 0.0
    t.integer "location",        limit: 8, default: 1
    t.integer "room",            limit: 8
    t.text    "plantid"
    t.integer "sessiontime",     limit: 8
    t.text    "userid"
    t.integer "wastetype",       limit: 2, default: 0
    t.decimal "expectedweight",            default: 0.0
    t.integer "conversiontype",  limit: 2, default: 0
    t.text    "reason"
    t.integer "replication_val", limit: 8
  end

  add_index "waste", ["replication_val"], name: "waste_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "weighheavy", force: true do |t|
    t.integer "setting",         limit: 2, default: 0
    t.integer "nearest",         limit: 2, default: 0
    t.integer "cumulative",      limit: 2, default: 0
    t.integer "replication_val", limit: 8
  end

  add_index "weighheavy", ["replication_val"], name: "weighheavy_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "wholesalepayments", force: true do |t|
    t.integer "ticketid",               limit: 8
    t.text    "paymentmethod"
    t.decimal "amount"
    t.integer "vendorid",               limit: 8
    t.integer "datetime",               limit: 8
    t.integer "deleted",                limit: 2, default: 0
    t.integer "location",               limit: 8, default: 1
    t.integer "terminalid",             limit: 8
    t.integer "transactionid",          limit: 8
    t.integer "potype",                 limit: 2
    t.integer "direction",              limit: 2
    t.integer "transactionid_original", limit: 8
    t.integer "replication_val",        limit: 8
    t.integer "on_account",             limit: 2
  end

  add_index "wholesalepayments", ["replication_val"], name: "wholesalepayments_replication_idx", where: "(replication_val > 0)", using: :btree

  create_table "wholesaletickets", force: true do |t|
    t.integer "potype",                 limit: 2
    t.decimal "price"
    t.decimal "tax"
    t.decimal "totalprice"
    t.integer "terminal",               limit: 8
    t.text    "userid"
    t.integer "datetime",               limit: 8
    t.integer "location",               limit: 8, default: 1
    t.integer "vendorid",               limit: 8
    t.integer "deleted",                limit: 2, default: 0
    t.text    "voidedby"
    t.text    "voidreason"
    t.integer "transactionid",          limit: 8
    t.integer "direction",              limit: 2
    t.integer "pif",                    limit: 2, default: 1
    t.integer "transactionid_original", limit: 8
    t.integer "replication_val",        limit: 8
  end

  add_index "wholesaletickets", ["replication_val"], name: "wholesaletickets_replication_idx", where: "(replication_val > 0)", using: :btree

end
