require "legacy_uuid/version"

module LegacyUUID
  REGIONS = {
    au: 1,
    nz: 2,
    uk: 3,
    gb: 3,
    us: 4,
    ie: 5,
  }

  def self.region_component(region)
    REGIONS.fetch(region.to_sym).to_s(16).rjust(4, "0")
  end

  def self.id_component(id)
    id.to_i.to_s(16).rjust(12, "0")
  end

  def self.from(uid, prefix:)
    region, id = uid.split("-")
    "#{prefix}-#{region_component(region)}-4000-8000-#{id_component(id)}"
  end

  def self.from_campaign(uid)
    from(uid, prefix: "eda1e64c")
  end

  def self.from_charity(uid)
    from(uid, prefix: "edb1e64c")
  end
end
