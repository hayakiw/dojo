module ApplicationHelper
  # routeをshallowを使用して作成したコントローラのform_for用
  def form_for_arg_if_shallow(parent, child)
    child.try(:new_record?) ? [parent, child] : child
  end
end
