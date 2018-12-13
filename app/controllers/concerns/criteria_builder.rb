module CriteriaBuilder
  extend ActiveSupport::Concern

  def build_criteria(params)
    if params[:q].instance_values["parameters"]
      criteria = params[:q].instance_values["parameters"].to_hash
    else
      criteria = {}
    end

    criteria["per_page"] = params["per_page"]
    criteria["page"]     = params["page"]
    return criteria.sort.to_s
  end
end
