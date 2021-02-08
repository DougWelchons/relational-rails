class MembersController < ApplicationController
  before_action :set_member, only: [:edit, :show]

  def index
    members = Member.all
    @members = members.sort_by do |member|
      member.created_at
    end.reverse
  end

  def show
    @orv_count = @member.orv_list.count
  end

  def create
    member = Member.new({
      name: params[:member][:name],
      skill_level: params[:member][:skill_level],
      premium_member: status_check(params[:member][:premium_member])
      })

    member.save

    redirect_to '/members'
  end

  def update
    member = Member.find(params[:id])
    member.update({
      name: params[:member][:name],
      skill_level: params[:member][:skill_level],
      premium_member: status_check(params[:member][:premium_member])
      })

    member.save

    redirect_to "/members/#{member.id}"
  end

  def destroy
    Member.destroy(params[:id])
    redirect_to "/members"
  end

  def set_member
    @member = Member.find(params[:id])
  end
end
