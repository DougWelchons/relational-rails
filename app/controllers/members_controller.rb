class MembersController < ApplicationController

  def index
    @members = Member.all
  end

  def new
  end

  def show
    @member = Member.find(params[:id])
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

  def edit
    @member = Member.find(params[:id])
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

  def status_check(info)
    if info == nil
      false
    else
      info
    end
  end
end
