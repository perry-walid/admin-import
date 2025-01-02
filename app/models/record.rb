class Record < ApplicationRecord
    scope :filter_by_pid, ->(pid) { where(pid: pid) }
    scope :filter_by_iban, ->(iban) { where(iban: iban) }
    scope :filter_by_trade_license_number, ->(number) { where(trade_license_number: number) }
end