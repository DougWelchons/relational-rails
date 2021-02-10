class MembersController < ApplicationController
  before_action :set_member, only: [:edit, :show, :update]

  def index
    members = Member.all
    @members = members.sort_by do |member|
      member.created_at
    end.reverse
  end

  def show
    # binding.pry
    @orv_count = @member.orv_list.count
  end

  def create
    member = Member.new({
      name: params[:name],
      skill_level: params[:skill_level],
      premium_member: status_check(params[:premium_member])
      })

    member.save

    redirect_to '/members'
  end

  def update
    # member = Member.find(params[:id])
    @member.update({
      name: params[:name],
      skill_level: params[:skill_level],
      premium_member: status_check(params[:premium_member])
      })

    respond_to do |format|
      format.html {redirect_to "/members/#{@member.id}"}
    end
    # redirect_to "/members/#{@member.id}"
  end

  def destroy
    Member.destroy(params[:id])
    redirect_to "/members"
  end

  def set_member
    @member = Member.find(params[:id])
  end
end
