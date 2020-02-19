require "legacy_uuid/version"

module LegacyUUID
  REGIONS = {
    :au => 1,
    :nz => 2,
    :uk => 3,
    :gb => 3,
    :us => 4,
    :ie => 5,
  }

  PREFIXES = {
    :campaign =>         "eda1e64c",
    :charity =>          "edb1e64c",
    :page =>             "edc1e64c",
    :hero_page =>        "ede1e64c",
    :team =>             "edd1e64c",
    :donation =>         "eaa1e64c",
    :donor =>            "eab1e64c",
    :organiser =>        "eac1e64c",
    :offline_donation => "ead1e64c",
    :network =>          "eae1e64c",
  }

  def self.region_component(region)
    REGIONS.fetch(region.to_sym).to_s(16).rjust(4, "0")
  end

  def self.id_component(id)
    id.to_i.to_s(16).rjust(12, "0")
  end

  def self.from(uid, type)
    prefix = PREFIXES.fetch(type)
    region, id = uid.split("-")

    "#{prefix}-#{region_component(region)}-4000-8000-#{id_component(id)}"
  end

  def self.from_campaign(uid)
    from(uid, :campaign)
  end

  def self.from_charity(uid)
    from(uid, :charity)
  end

  def self.from_page(uid)
    from(uid, :page)
  end

  def self.from_hero_page(uid)
    from(uid, :hero_page)
  end

  def self.from_team(uid)
    from(uid, :team)
  end

  def self.from_donation(uid)
    from(uid, :donation)
  end

  def self.from_donor(uid)
    from(uid, :donor)
  end

  def self.from_organiser(uid)
    from(uid, :organiser)
  end

  def self.from_offline_donation(uid)
    from(uid, :offline_donation)
  end

  def self.from_network(uid)
    from(uid, :network)
  end

  def self.type_of(uuid)
    PREFIXES.invert.fetch(uuid.split("-").first.downcase, :unknown)
  end

  def self.uid_of(uuid)
    _, region, _, _, id = uuid.split("-")

    region_code = REGIONS.invert[region.to_i]
    # REGIONS.invert is non-deterministic for gb/uk - this forces gb
    region_code = "gb" if region_code == "uk"
    id = id.to_i(16)

    "#{region_code}-#{id}"
  end
end
