class Record < ApplicationRecord
    belongs_to :sheet, optional: true
    scope :filter_by_pid, ->(pid) { where(pid: pid) }
    scope :filter_by_iban, ->(iban) { where(iban: iban) }
    scope :filter_by_trade_license_number, ->(number) { where(trade_license_number: number) }
    scope :filter_by_sheet_id, ->(sheet_id) { where(sheet_id: sheet_id) }
end
