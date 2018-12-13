module CriteriaBuilder
  extend ActiveSupport::Concern

  def build_criteria(params)
    if params[:q].instance_values["parameters"]
      criteria = params[:q].instance_values["parameters"].to_hash
    else
      criteria = {}
    end

    criteria["near"]     = params["near"]
    criteria["radius"]   = params["radius"]
    criteria["page"]     = params["page"]
    criteria["per_page"] = params["per_page"]
    return criteria.sort.to_s
  end
end
